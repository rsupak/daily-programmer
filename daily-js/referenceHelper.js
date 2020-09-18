var ReferenceQualifierHelper = Class.create();
ReferenceQualifierHelper.prototype = {

    backfillAssignmentGroup: function() {
      var company = current.company;

      //return if the assigned_to value is empty (this causes all groups to be returned)
      if (!company)
          return;

      // Query Database for group records where type contains 'incident'
      var groupRecords = new GlideRecord('sys_user_group');
      // Replace the <encoded query...> with your encoded query string
      groupRecords.addEncodedQuery('<encoded query for GP group>^ORcompany=' + company);
      
      groupRecords.query();
      var assignmentGroups= '';
		
      while (groupRecords.next()) {
			  assignmentGroups += groupRecords.sys_id + ',';
      }
		
		
      // Log change in system log with current user's initials
      var user = gs.getUserDisplayName();
      user = user.split(' ').map(function(x) {
          return x[0];
      }).join('');

      gs.log(user + ': RefQual = ' + 'sys_idIN' + assignmentGroups);

      // Return encoded query string
      return 'sys_idIN' + assignmentGroups;
    },
    type: 'ReferenceQualifierHelper'
};
