var myDate = new GlideDateTime(inputs.start_date)
var newRel = new GlideDateTime(inputs.relative_duration)
var dur = newRel.getNumericValue()
myDate.add(dur)
outputs.calculated_relative_date = myDate.getValue();
