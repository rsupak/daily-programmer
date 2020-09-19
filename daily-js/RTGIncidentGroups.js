var ReferenceQualifierHelper = Class.create();
ReferenceQualifierHelper.prototype = {

  backfillAssignmentGroup: function () {
    var assignee = current.assigned_to;

    // Setup for using SN ArrayUtils;
    var arrayUtil = new ArrayUtil();

    //return if the assigned_to value is empty (this causes all groups to be returned)
    if (!assignee)
      return;

    // Query Database for records where assigned_to is a group member
    var assigneeGroupsQualifier;
    var grAssigneeGroups = new GlideRecord('sys_user_grmember');
    grAssigneeGroups.addQuery('user', assignee);
    grAssigneeGroups.query();

    while (grAssigneeGroups.next()) {
      if (assigneeGroupsQualifier.length == 0) {
        // Create the beginning of the qualifier and add the 1st group
        assigneeGroupsQualifier = grAssigneeGroups.getValue('group');
      } else {
        // build a comma separated string of groups if there is more than one
        assigneeGroupsQualifier += (',' + grAssigneeGroups.group);
      }
    }

    // Query Database for groups which contain Type : 'incident'
    var incidentGrps;
    var grIncidentGroups = new GlideRecord('sys_user_group');
    grIncidentGroups.addEncodedQuery('typeLIKEeb1ddec1db9640100bcd7a61399619c0');
    grIncidentGroups.query();

    while (grIncidentGroups.next()) {
      if (incidentGrps.length == 0) {
        // Create the beginning of the qualifier and add the 1st group
        incidentGrps = grIncidentGroups.getUniqueValue();
      } else {
        // build a comma separated string of groups if there is more than one
        incidentGrps += (',' + grIncidentGroups.sys_id);
      }
    }

    // Filter Incident groups from total assignee group list
    assigneeGroupsQualifier = assigneeGroupsQualifier.split(',');
    incidentGrps = incidentGrps.split(',');
    var assigneeIncidentGroups = [];
    assigneeIncidentGroups = arrayUtil.intersect(incidentGrps, assigneeGroupsQualifier).join(',');

    // Log change in system log with current user's initials
    var user = gs.getUserDisplayName();
    user = user.split(' ').map(function (x) {
      return x[0];
    }).join('');

    gs.log(user + ': RefQual = ' + 'sys_idIN' + assigneeIncidentGroups);

    // Return encoded query string
    return 'sys_idIN' + incGrps;
  },
  type: 'ReferenceQualifierHelper' //What allows you to reference the Script Include elsewhere(i.e. Client Script)
};
