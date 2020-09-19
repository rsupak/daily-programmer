var ActivityDAO = Class.create();
ActivityDAO.prototype = {
  initialize: function (activitySubContext) {
    this.activitySubContext = activitySubContext;
    this.subscriptionDAO = activitySubContext.getSubscriptionDAO();
    this.ACTIVITY_STREAM_TABLE = "sn_actsub_activity_stream";
    this.ACTIVITY_TYPE_TABLE = "sn_actsub_activity_type";
    this.ACTIVITY_TABLE = "sn_actsub_activity";
    this.STREAM_TABLE = "sn_actsub_user_stream";
    this.ACTIVITY_FANOUT = "sn_actsub_activity_fanout";
    this.ACTIVITY_RECORD_LIMIT = 50;
    this.USER_STREAM_LIMIT = 2000;
    this._isFanoutEnabled = 0;
    this.ADVANCED_LEVEL_ACTIVITY_TYPE = "65c47eca531332003760ddeeff7b125c";
    this.VERB_MARK_AS_CORRECT_ANSWER = "mark_as_correct_ans";
    this.activityStreamCache = new ActivityStreamCacheManager();
  },
  getActivityJSON: function (activity) {
    var streamGr = new GlideRecord(this.ACTIVITY_STREAM_TABLE);
    streamGr.addQuery('activity_id', activity.sys_id);
    streamGr.addQuery('stream_id.user_id', activity.target_id);
    streamGr.query();
    if (streamGr.next()) {
      // RWS - Why create a 1-time use local variable? return the parsed JSON
      // RWS - If you are returning activity_json here and !streamGr.next()
      // RWS - You'll potentially throw an error here without declaring it with var
      // RWS - If it doesn't throw an error, it could potentially throw an 'undefined'
      var activity_json = JSON.parse(streamGr.activity_nl_string_json);
    }
    return activity_json;
  },
  getRelatedActivity: function (activity) {
    if (!activity) return;

    var isUndo = activity.verb != activity.activity_type_id.verb;
    var activity_type_id = activity.activity_type_id;
    var relatedActivity = new GlideRecord(this.ACTIVITY_TABLE);
    relatedActivity.addQuery('activity_type_id', activity_type_id.sys_id);
    relatedActivity.addQuery('actor_id', activity.actor_id);
    relatedActivity.addQuery('object_id', activity.object_id);
    if (isUndo) {
      relatedActivity.addQuery('verb', activity_type_id.verb);
      relatedActivity.addQuery('sys_created_on', '<=', activity.sys_created_on);
      relatedActivity.orderByDesc('sys_created_on');
    } else {
      relatedActivity.addQuery('verb', activity_type_id.undo_verb);
      relatedActivity.addQuery('sys_created_on', '>=', activity.sys_created_on);
      relatedActivity.orderBy('sys_created_on');
    }
    relatedActivity.setLimit(1);
    relatedActivity.query();
    if (relatedActivity.next()) {
      return relatedActivity;
    }
    return;
  },

  getRelatedActivityById: function (activityId) {
    var activity = new GlideRecord(this.ACTIVITY_TABLE);
    if (activity.get(activityId)) {
      return this.getRelatedActivity(activity);
    } else return gs.getMessage("Either no activity available or not accessible.");
  },

  getActivity: function (activityId) {

    var cloneActivity = function (activity) {
      // RWS - You may pull other key, value pairs from activity, but if you are
      // RWS - creating a clone, that shouldn't be an issue.
      var _activity = {};
      for (var obj of Object.keys(activity)) {
        _activity[obj] = '' + activity[obj];
      }
      return _activity;
    };
    var activity = new GlideRecord(this.ACTIVITY_TABLE);
    if (activity.get(activityId) && activity.canRead()) {
      var _activity = cloneActivity(activity);
      _activity.isUndo = activity.verb != activity.activity_type_id.verb;

      var activity_type_id = activity.activity_type_id;
      var relatedActivity = new GlideRecord(this.ACTIVITY_TABLE);
      relatedActivity.addQuery('activity_type_id', activity_type_id.sys_id);
      relatedActivity.addQuery('actor_id', activity.actor_id);
      if (_activity.isUndo) {
        relatedActivity.addQuery('verb', activity_type_id.verb);
        relatedActivity.addQuery('sys_created_on', '<=', activity.sys_created_on);
        relatedActivity.orderByDesc('sys_created_on');
      } else {
        relatedActivity.addQuery('verb', activity_type_id.undo_verb);
        relatedActivity.addQuery('sys_created_on', '>=', activity.sys_created_on);
        relatedActivity.orderBy('sys_created_on');
      }
      relatedActivity.setLimit(1);
      relatedActivity.query();
      if (relatedActivity.next() && relatedActivity.canRead()) {
        _activity.relatedActivity = cloneActivity(relatedActivity);
        _activity.relatedActivity.isUndo = relatedActivity.verb != relatedActivity.activity_type_id.verb;
      }
      return _activity;
    }
    return gs.getMessage("Either no activity available or not accessible.");
  },

  flushStreamCacheForSubscribers: function (subscribers) {
    if (!subscribers) return;

    subscribers = subscribers.split(',');
    this.activityStreamCache.flushStreams(subscribers);
  },

  getActivities: function (activity_count, streamID, start, end, before, actor, enableAggregation, isFirstLoad) {
    try {
      var _usr = "" + gs.getUserID();
      var isCacheEnabled = gs.getProperty("com.snc.actsub.activity.stream.cache.enable") == "true";
      start = parseInt(start);
      end = parseInt(end);
      before = before + "";
      if (actor)
        actor = actor + "";
      var verbs = ['posted', 'advanced_a_level', 'content_moved_to'];
      var liveProfileId = this.subscriptionDAO.getLiveProfileId(gs.getUserID());
      var stream;
      var sessionData;
      var results = [];
      if (isCacheEnabled) {
        var _hasMore = true;
        var reConstructStream = false;
        var lastSynch = gs.getSession().getClientData('activity_stream_last_synch_time');
        var hasNewUpdates = this.activityStreamCache.hasNewUpdates(_usr, lastSynch);
        if (!hasNewUpdates) {
          var _stream = gs.getSession().getClientData('activity_stream');
          stream = JSON.parse(_stream);
        }
        var resetStream = function () {
          stream = {};
          stream.sys_id = "" + streamID;
          stream.before = "" + before;
          stream.actor = actor;
          reConstructStream = true;
        };

        if (stream) {
          _hasMore = stream.hasMoreRecords;
        }

        // Reset stream if there is no stream in cache
        if (!stream || actor != stream.actor) {
          resetStream();
        }

        if (!reConstructStream) {
          // If the request is from same origin and data exists in cache, return data from cache. OR
          // If there are no new activities, return data from cache.
          if (start < stream.data.length && (end <= stream.data.length || !_hasMore && end > stream.data.length)) {
            return {
              "activities": stream.data.slice(start, end),
              "hasMoreRecords": stream.hasMoreRecords || end < stream.data.length,
              "nextRecord": end,
              "fromCache": true
            };
          }
        }

        if (reConstructStream) {
          stream.primaryContents = [];
          stream.data = [];
        }
      } else {
        var _sessionData = gs.getSession().getClientData('activity_stream_state');
        sessionData = JSON.parse(_sessionData);
        if (!sessionData || sessionData.before != before) {
          sessionData = {};
          sessionData.primaryContents = [];
          sessionData.before = before + "";
        }
      }

      var counter = 0;
      var countToReturn = end - start;
      var hasMoreRecords = true;
      var limit = activity_count || this.ACTIVITY_RECORD_LIMIT;

      var commActivityService, commUser;
      if (this.activitySubContext.isCommunityPluginActive == true) {
        commUser = new sn_communities.CommunityUserBase();
        commActivityService = new sn_communities.CommunityActivityService(liveProfileId, true);
      }


      var from, to;
      if (isCacheEnabled && stream) {
        from = stream.nextWindowFrom;
        to = stream.nextWindowTo;
      }
      // Find the window range based on requested limits.
      // Case : 1 - No information available in cache
      if (!from)
        from = 0;
      if (!to)
        to = from;

      if (isCacheEnabled && stream) {
        //Case : 2 - Requesting more records
        if (start > stream.data.length)
          countToReturn = end - stream.data.length;
        //Case : 3 - requesting existing records with unexpected start and end. It is similar to reload cache.
        else if (start < stream.data.length) {
          from = 0;
          countToReturn = end;
        }
      } else {
        from = start;
      }

      // Interpret the offset based on the accuracy of previous fetch. This is a probability fetch.
      // This will avoid extra round trips to DB
      var getInterprettedOffset = function (requiredCount, probabilityRatio) {
        var multiplier = 5; // expecting each activitity feed item duplicated 5 times w.r.t primary content 
        var getOffset = function (_offset) {
          if (!_offset)
            return 1;
          else return _offset + 1;
        };
        if (!enableAggregation)
          return getOffset(0);
        if (!requiredCount)
          requiredCount = countToReturn;
        if (!probabilityRatio)
          return getOffset(multiplier * requiredCount);
        else {
          if (probabilityRatio < multiplier)
            probabilityRatio = multiplier;
          var offset = requiredCount * probabilityRatio;
          // If offset is more, limit to some value to avoid fetching too many records from DB.
          if (offset > multiplier * 100)
            offset = multiplier * 100;
          return getOffset(offset);
        }

      };
      to = from + countToReturn + getInterprettedOffset(countToReturn);

      var _previousTo;
      // Reset from value to 0 if the no data available in session.
      if (!isCacheEnabled && sessionData.primaryContents.length == 0) {
        _previousTo = from;
        from = 0;
      }

      if (isCacheEnabled) {
        var longTime = (new GlideDateTime()).getNumericValue();
        gs.getSession().putClientData('activity_stream_last_synch_time', "" + longTime);
        this.activityStreamCache.streamLoaded(_usr, "" + longTime);
      }
      var currentRow = 0;
      var disqualifiedContents = [];
      var _nextRecord;
      while ((counter <= countToReturn) && hasMoreRecords) {
        currentRow = from;
        var activities = new GlideRecord(this.ACTIVITY_STREAM_TABLE);
        activities.addQuery('stream_id', streamID);

        if (actor) {
          activities.addQuery('activity_id.actor_id', actor);
        } else {
          activities.addQuery('activity_id.actor_id', '!=', liveProfileId)
            .addOrCondition('activity_id.verb', 'IN', verbs.join(','));
        }
        activities.addQuery('activity_id.active', true);

        activities.orderByDesc("sys_created_on");

        if (before)
          activities.addQuery('sys_created_on', '<=', before);
        activities.chooseWindow(from, to);
        activities.query();

        var activitiesCount = 0;
        while ((counter <= countToReturn) && activities.next()) {
          currentRow++;
          if (currentRow >= activities.getRowCount())
            hasMoreRecords = false;

          var activity = activities.activity_id.getRefRecord();
          var aggAct;
          var primaryContent;

          if (commActivityService != null) {
            aggAct = commActivityService.getContentInfo(activity);
            // Check if already an activity processed for this activity's content
            if (aggAct) {
              primaryContent = aggAct.root + "";
              if (!primaryContent) {
                continue; // No primary or secondary content exists with this activity.
              }
              if (enableAggregation) {
                if (disqualifiedContents.indexOf(primaryContent) != -1) {
                  continue;
                }

                if (!isCacheEnabled && sessionData && sessionData.primaryContents.indexOf(primaryContent) != -1 ||
                  isCacheEnabled && stream && stream.primaryContents.indexOf(primaryContent) != -1) {
                  disqualifiedContents.push(primaryContent);
                  continue;
                }
                //aggAct.activity_stream = "" + activities.sys_id;
              }

              var moderatedContent = commActivityService.getModeratedContentId(aggAct);
              if (moderatedContent) {
                if (enableAggregation) {
                  disqualifiedContents.push(moderatedContent + "");
                }
                continue;
              }
            }

            if (!commActivityService.canReadActivityStream(activities, commUser)) {
              continue; //check for read access
            }
          } else if (!activities.canRead()) {
            continue; //check for read access with ACL evaluation.
          }

          if (counter >= countToReturn) {
            counter++;
            hasMoreRecords = true;
            continue;
          }

          // Re-construct the previous pages primary content sys_ids.
          if (!isCacheEnabled && currentRow <= _previousTo) {
            if (primaryContent)
              sessionData.primaryContents.push(primaryContent);
          } else {
            var activity_json;
            if (activity.getElement('actor_id') &&
              activity.getElement('object_id') &&
              activity.getElement('target_id')) {
              if (commActivityService != null) {
                activity_json = commActivityService.getActivityStreamJSON(activity, '' + activities.activity_nl_string_json, {
                  'actor': actor
                });
                if (commActivityService.skipActivity) {
                  var idx = disqualifiedContents.indexOf(primaryContent);
                  if (idx > -1) disqualifiedContents.splice(idx, 1);
                  continue;
                }
              }
              if (activity_json && activity.activity_type_id.use_stream_json)
                activity_json.streamJSON = activities.activity_nl_string_json;

              if (activity_json) {
                counter++;
                if (counter == countToReturn) {
                  _nextRecord = 0 + currentRow;
                }
                if (enableAggregation) {
                  if (primaryContent) {
                    if (isCacheEnabled && stream)
                      stream.primaryContents.push(primaryContent);
                    else if (sessionData)
                      sessionData.primaryContents.push(primaryContent);
                  }
                }
                if (isCacheEnabled && stream)
                  stream.data.push(activity_json);
                else
                  results.push(activity_json);
                activitiesCount++;
              }
            }
          }
        }

        if (activities.getRowCount() == 0 || activities.getRowCount() <= from) {
          hasMoreRecords = false;
        }

        var requiredCount = parseInt(countToReturn - counter);
        var probabilityRatio = ((to - from) / (activitiesCount));
        from = parseInt(to);
        to = parseInt(to) + requiredCount + getInterprettedOffset(requiredCount, probabilityRatio);
      }

      var _activities;
      if (isCacheEnabled) {
        // Stream save point: Update the stream & put back into the cache.
        stream.nextWindowFrom = _nextRecord;
        stream.nextWindowTo = to + countToReturn;
        stream.hasMoreRecords = hasMoreRecords;
        gs.getSession().putClientData('activity_stream', JSON.stringify(stream));
        _activities = stream.data.slice(start, end);
        if (hasMoreRecords)
          _nextRecord = end;
        else
          _nextRecord = null;
      } else {
        gs.getSession().putClientData('activity_stream_state', JSON.stringify(sessionData));
        _activities = results;
        if (!hasMoreRecords)
          _nextRecord = null;
      }

      return {
        "activities": _activities,
        "hasMoreRecords": hasMoreRecords,
        "nextRecord": _nextRecord
      };
    } catch (er) {
      gs.info('Error while fetching activity stream: ' + er.message);
    }
  },

  gatherActivities: function (activity_count, subscriptions) {

    var activities = new GlideRecordSecure(this.ACTIVITY_TABLE);
    activities.addQuery('object_id', 'IN', subscriptions).addOrCondition('target_id', 'IN', subscriptions).addOrCondition('additional_field1', 'IN', subscriptions);
    activities.orderByDesc("sys_created_on");
    var limit = activity_count || this.ACTIVITY_RECORD_LIMIT;
    activities.setLimit(limit);
    activities.query();
    // RWS - ** Is subscriptionDAO referring to this.subscriptionDAO or a local variable **
    subscriptionDAO = this.activitySubContext.getSubscriptionDAO();
    var results = [];
    while (activities.next()) {


      var object_subscription =
        subscriptionDAO.isSubscribed(activities.object_id);
      var target_subscription =
        subscriptionDAO.isSubscribed(activities.target_id);
      var additional_field_subscription =
        subscriptionDAO.isSubscribed(activities.additional_field1);

      var date1 = new GlideDateTime(object_subscription.createdDate).getNumericValue();
      var date2 = new GlideDateTime(target_subscription.createdDate).getNumericValue();
      var date3 = new GlideDateTime(additional_field_subscription.createdDate).getNumericValue();
      var subscribed_date = this.findNonZeroMinimum(date1, date2, date3);

      var activity_date = new GlideDateTime(activities.sys_created_on).getNumericValue();
      if (activity_date < subscribed_date) continue;

      var activity_data = {};
      activity_data.activity_id = activities.sys_id + '';
      activity_data.message = activities.activity_type_id.activity_nl_string.message.replace("{0}", activities.actor_id.getRefRecord().getDisplayValue()).replace("{1}", activities.object_id.getRefRecord().getDisplayValue()).replace("{2}", activities.target_id.getRefRecord().getDisplayValue());
      activity_data.user_details = {};
      activity_data.user_details.profile_id = activities.actor_id + '';
      activity_data.user_details.name = activities.actor_id.getRefRecord().getDisplayValue() + '';
      activity_data.user_details.photo = activities.actor_id.photo.getDisplayValue();
      results.push(activity_data);
    }
    return results;
  },
  isFanoutEnabled: function (streamID) {
    var gr = new GlideRecord(this.STREAM_TABLE);
    gr.addQuery('sys_id', streamID);
    gr.query();
    if (gr.next()) {
      this._isFanoutEnabled = gr.getValue('fanout_to_stream');
      return this._isFanoutEnabled;
    }
    return 0;
  },
  initiateFanout: function (current) {
    var gr = new GlideRecord(this.ACTIVITY_FANOUT);
    gr.addQuery('active', true);
    gr.orderBy("order");
    gr.query();
    while (gr.next()) {
      gs.eventQueue(gr.fanout_event.getDisplayValue(), current, '', '');
    }
  },
  getActivityType: function (sourceTable, verb) {
    if (!sourceTable) return null;

    var gr = new GlideRecord(this.ACTIVITY_TYPE_TABLE);
    gr.addQuery('activity_source_table', sourceTable);
    gr.addActiveQuery();
    if (verb)
      gr.addQuery('verb', verb);
    gr.query();
    if (gr.next()) return gr;
    return null;
  },
  getActivityTypeForAdmin: function (activityId) {

    var gr = new GlideRecord(this.ACTIVITY_TYPE_TABLE);
    gr.addQuery('sys_id', activityId);
    gr.query();
    if (gr.next()) return gr;
    return null;
  },
  initializeActivity: function () {
    var gr = new GlideRecord(this.ACTIVITY_TABLE);
    gr.newRecord();
    return gr;
  },
  createActivity: function (source, verb, isUndoActivity, activityGr, valueMap) {
    var activityType = this.getActivityType(source.getTableName(), verb);
    if (!activityType) {
      try {
        var sourceTable = source.getTableName();
        var parentTable = GlideDBObjectManager.get().getBase(sourceTable);
        if (parentTable && parentTable != sourceTable) {
          activityType = this.getActivityType(parentTable, verb);
        }
      } catch (er) {
        gs.info('Error while fetching activity type for parent table: ' + er.message);
      }
    }
    try {
      if (activityType && (!isUndoActivity || (isUndoActivity && activityType.undo_verb))) {
        var source_table = '' + source.getTableName();
        var source_id = source.sys_id;
        var actorField = '' + activityType.actor_field;
        var objectField = activityType.object_field;
        var targetField = activityType.target_field;
        var additionalField1 = activityType.additional_field1;
        var addlSubObj2 = activityType.addl_sub_obj2;
        var addlSubObj3 = activityType.addl_sub_obj3;

        var gr;
        if (!activityGr) {
          gr = new GlideRecord(this.ACTIVITY_TABLE);
          gr.initialize();
        } else {
          gr = activityGr;
        }
        gr.activity_type_id = '' + activityType.sys_id;
        var isReferenceField = this._isReferenceField(source, actorField);
        if (isReferenceField) {
          gr.actor_name = '' + source.getElement(actorField).getED().getReference();
          gr.actor_id = '' + source.getElement(actorField);
        } else {
          gr.actor_name = '' + source.getTableName();
          gr.actor_id = '' + source.getValue(actorField);
        }
        var isActorSessionUser = activityType.actor_is_session_user;
        if (isActorSessionUser == true)
          gr.actor_id = '' + this.subscriptionDAO.getLiveProfileId(gs.getUserID());

        isReferenceField = this._isReferenceField(source, objectField);

        if (isReferenceField) {
          gr.object_name = source.getElement(objectField).getED().getReference();
          //For document_id field references
          if (!gr.object_name)
            gr.object_name = '' + source.getValue(source.getElement(objectField).getED().getDependent());
          gr.object_id = '' + source.getElement(objectField);
        } else {
          gr.object_name = '' + source.getTableName();
          gr.object_id = '' + source.getValue(objectField);
        }
        isReferenceField = this._isReferenceField(source, targetField);
        if (isReferenceField) {
          gr.target_name = source.getElement(targetField).getED().getReference();
          //For document_id field references
          if (!gr.target_name) {
            gr.target_name = '' + source.getValue(source.getElement(targetField).getED().getDependent());
          }
          gr.target_id = '' + source.getElement(targetField);
        } else {
          gr.target_name = '' + source.getTableName();
          gr.target_id = '' + source.getValue(targetField);
        }

        if (additionalField1) {
          isReferenceField = '' + this._isReferenceField(source, additionalField1);
          if (isReferenceField) {
            gr.additional_field1_name = '' + source.getElement(additionalField1).getED().getReference();
            if (!gr.additional_field1_name)
              gr.additional_field1_name = source.getValue(source.getElement(additionalField1).getED().getDependent());

            gr.additional_field1 = '' + source.getElement(additionalField1);
            if (gr.additional_field1_name == 'sn_communities_topic' &&
              !gr.additional_field1 && source.topics)
              gr.additional_field1 = '' + source.topics;
          } else {
            gr.additional_field1_name = '' + source.getTableName();
            gr.additional_field1 = '' + source.getValue(additionalField1);
          }
          if (valueMap && valueMap.additional_field1)
            gr.additional_field1 = '' + valueMap.additional_field1;
        }
        if (addlSubObj2) {
          isReferenceField = this._isReferenceField(source, addlSubObj2);
          if (isReferenceField) {
            gr.addl_sub_obj2_name = source.getElement(addlSubObj2).getED().getReference() || source.getElement('reference_name');
            gr.addl_sub_obj2_name = gr.addl_sub_obj2_name || source.getValue(source.getElement(addlSubObj2).getED().getDependent());
            gr.addl_sub_obj2 = '' + source.getElement(addlSubObj2);
            if (gr.addl_sub_obj2_name == 'sn_communities_content' ||
              gr.addl_sub_obj2_name == 'kb_social_qa_comment') {
              if (source.root_id) {
                gr.addl_sub_obj2_name = source.root_id.content_name;
                gr.addl_sub_obj2 = source.root_id.content_id;
              } else {
                gr.addl_sub_obj2_name = source.content_name;
                gr.addl_sub_obj2 = source.content_id;
              }
              if (source.getTableName() == 'kb_social_qa_comment') {
                gr.addl_sub_obj2_name = source.content.root_id.content_name;
                gr.addl_sub_obj2 = source.content.root_id.content_id;
              }
            }
          } else {
            gr.addl_sub_obj2_name = '' + source.getTableName();
            gr.addl_sub_obj2 = '' + source.getValue(addlSubObj2);
          }
        }
        if (addlSubObj3) {
          isReferenceField = this._isReferenceField(source, addlSubObj3);
          if (isReferenceField) {
            gr.addl_sub_obj3_name = source.getElement(addlSubObj3).getED().getReference();
            gr.addl_sub_obj3_name = gr.addl_sub_obj3_name || source.getValue(source.getElement(addlSubObj3).getED().getDependent());
            gr.addl_sub_obj3 = '' + source.getElement(addlSubObj3);
          } else {
            gr.addl_sub_obj3_name = '' + source.getTableName();
            gr.addl_sub_obj3 = '' + source.getValue(addlSubObj3);
          }
        }
        if (isUndoActivity == true && gr.activity_type_id.undo_verb) {
          gr.verb = gr.activity_type_id.undo_verb;
          gr.active = false;
          var parent = new GlideRecord(this.ACTIVITY_TABLE);
          parent.addQuery('activity_type_id', gr.activity_type_id.sys_id);
          parent.addQuery('verb', gr.activity_type_id.verb);
          parent.addQuery('object_id', gr.object_id);
          if (gr.activity_type_id.verb != this.VERB_MARK_AS_CORRECT_ANSWER)
            parent.addQuery('actor_id', gr.actor_id);
          parent.addQuery('active', true);
          parent.orderByDesc('sys_created_on');
          parent.setLimit(1);
          parent.query();
          if (parent.next()) {
            parent.active = false;
            parent.update();
          }
          return;
        } else gr.verb = gr.activity_type_id.verb;

        gr.insert();
      }
    } catch (err) {
      gs.info('ACTSUB-ERROR in createActivity:' + err.message);
    }
  },

  _isReferenceField: function (source, fieldName) {
    return (fieldName.indexOf('.') != -1 || source.getElement(fieldName).getRefRecord()) ? true : false;
  },

  populateActivityStream: function (activity, subscribers, activityJSON, additionalAttributes) {
    subscribers = subscribers.split(',');
    for (var i = 0, subs_len = subscribers.length; i < subs_len; ++i) {
      var streams = this._getStreamsforUser(subscribers[i]);

      for (var j = 0, str_len = streams.length; j < str_len; ++j) {

        var activitiesCount = this.getActivitiesCountByUserInStream(streams[j]);
        var userStreamLimit = parseInt(gs.getProperty('com.snc.actsub.activity.stream.user.limit', this.USER_STREAM_LIMIT));
        if (activitiesCount >= userStreamLimit) {
          this._autoRotateActivityStream(streams[j]);
        }
        var gr = new GlideRecord(this.ACTIVITY_STREAM_TABLE);
        gr.initialize();
        gr.activity_id = activity.sys_id;
        gr.stream_id = streams[j];

        var activity_json = {};
        if (activityJSON != null) {
          activity_json = activityJSON;
        } else if (activity.activity_type_id.sys_id == this.ADVANCED_LEVEL_ACTIVITY_TYPE) {
          var streamGr = new GlideRecord(this.ACTIVITY_STREAM_TABLE);
          streamGr.addQuery('activity_id', activity.sys_id);
          streamGr.addQuery('stream_id.user_id', activity.target_id);
          streamGr.query();
          if (streamGr.next()) {
            activity_json = JSON.parse(streamGr.activity_nl_string_json);
          }
        } else {
          activity_json = {
            "message": activity.activity_type_id.activity_nl_string.message + '',
            "actor": activity.getElement('actor_id').getRefRecord().getDisplayValue(),
            "object": activity.getElement('object_id').getRefRecord().getDisplayValue(),
            "target": activity.getElement('target_id').getRefRecord().getDisplayValue()
          };
        }
        if (additionalAttributes) {
          for (var att in additionalAttributes) {
            activity_json[att] = additionalAttributes[att];
          }
        }
        gr.activity_nl_string_json = new global.JSON().encode(activity_json);
        gr.insert();
      }
    }
  },
  getActivitiesCountByUserInStream: function (stream, profileId, fetchPrimary) {
    var ga = new GlideAggregate(this.ACTIVITY_STREAM_TABLE);
    ga.addQuery('stream_id', stream);
    //Activity Feed should be enabled when atleast 5 primary activities(post, advanced a level, badge awarded) are done
    if (fetchPrimary)
      ga.addQuery('activity_id.actor_id', '!=', profileId)
      .addOrCondition('activity_id.verb', 'IN', 'posted,advanced_a_level');
    ga.addAggregate('COUNT');
    ga.query();
    var activitiesCount = 0;
    if (ga.next())
      activitiesCount = ga.getAggregate('COUNT');
    return activitiesCount;
  },
  //Deletes the oldest record in the user's activity stream
  _autoRotateActivityStream: function (stream) {
    var gr = new GlideRecord(this.ACTIVITY_STREAM_TABLE);
    gr.orderBy('sys_created_on');
    gr.addQuery('stream_id', stream);
    gr.query();
    // RWS - What is the purpose of setting the local variable 'isDeleted' here?
    // RWS - It doesn't appear to be used outside of the conditional?
    var isDeleted;
    if (gr.next()) {
      isDeleted = gr.deleteRecord();
    }
  },
  getStreamID: function (stream, userId) {
    var gr = new GlideRecordSecure(this.STREAM_TABLE);
    gr.addQuery('name', stream);
    gr.addQuery('user_id', userId);
    gr.query();
    if (gr.next()) {
      this._isFanoutEnabled = gr.getValue('fanout_to_stream');
      return gr.sys_id;
    }
    return null;
  },

  _getStreamsforUser: function (userId) {
    var stream_ids = [];
    var gr = new GlideRecord(this.STREAM_TABLE);
    gr.addQuery('user_id.document', userId);
    gr.addQuery('fanout_to_stream', true);
    gr.query();
    while (gr.next()) {
      stream_ids.push(gr.sys_id + '');
    }
    return stream_ids;
  },

  findNonZeroMinimum: function () {
    var args = Array.prototype.slice.call(arguments);
    args.sort(function (a, b) {
      if (a === null || isNaN(a) || a === 0) return 1;
      if (b === null || isNaN(b) || b === 0) return -1;
      return a - b;
    });
    return args[0];
  },
  _getRecentNthActivityCrDt: function (limitCount) {
    var activities = new GlideRecord(this.ACTIVITY_TABLE);
    activities.orderByDesc('sys_created_on');
    activities.setLimit(limitCount);
    activities.query();
    if (activities.getRowCount() < limitCount)
      return null;
    activities.setLocation(limitCount - 1);
    return activities.getDisplayValue('sys_created_on');
  },

  getActivityInfo: function (activityId) {
    if (!activityId)
      return null;
    var activity = new GlideRecord(this.ACTIVITY_TABLE);
    if (activity.get(activityId)) {
      var activityInfo = {};
      activityInfo.active = activity.active + '';
      activityInfo.activity_type_id = activity.activity_type_id + '';
      activityInfo.actor_id = activity.actor_id + '';
      activityInfo.object_id = activity.object_id + '';
      activityInfo.object_name = activity.object_name + '';
      activityInfo.target_id = activity.target_id + '';
      activityInfo.target_name = activity.target_name + '';
      activityInfo.verb = activity.verb + '';
      return activityInfo;
    }
    return null;
  },
  type: 'ActivityDAO'
};
