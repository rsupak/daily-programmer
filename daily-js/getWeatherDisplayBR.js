var attributes = ['Confidentiality Terms', 'Access Terms', 'Insurance Terms', 'Indemnification Terms', 'Intellectual Property Terms', 'Breach & Dispute Terms', 'Assignment Terms', 'Records Retention Terms']

var confidentialityTerms = ['u_rtg_sharing_confidential_information', 'u_rtg_sharing_business_information', 'u_rtg_sharing_personally_identifying_information', 'u_rtg_sharing_hipaa_information', 'u_there_are_confidentiality_obligations', 'u_confidentiality_terms_are_reciprocal']
try {
  var inputs = {};
  inputs['city'] = current.location.city; // String 
  inputs['state'] = current.location.state; // String 

  // Start Asynchronously: Uncomment to run in background. Code snippet will not have access to outputs.
  // sn_fd.FlowAPI.startAction('global.weather_requests', inputs);

  // Execute Synchronously: Run in foreground. Code snippet has access to outputs.
  var outputs = sn_fd.FlowAPI.executeAction('global.weather_requests', inputs);

  // Get Outputs:
  // Note: outputs can only be retrieved when executing synchronously.
  var weather = outputs['weather']; // String
  g_scratchpad.weather = weather;
  g_scratchpad.location = current.location;
} catch (ex) {
  var message = ex.getMessage();
  gs.error(message);
}



try {
  var inputs = {};
  g_scrathpad.assignedTo = current.assigned_to;
} catch (err) {
  var message = error.getMessage();
  alert(message);
}


var user = gs.getUserDisplayName();
user = user.split(' ').map(function (x) {
  return x[0];
}).join('');

