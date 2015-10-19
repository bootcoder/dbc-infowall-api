// Birthplace of all time related things

var startTime = function(){
  var today = new Date();
  var h = today.getHours();
  var m = today.getMinutes();
  var s = today.getSeconds();
  m = checkTime(m);
  s = checkTime(s);
  document.getElementById('clock').innerHTML =
  h + ":" + m + ":" + s;
  var t = setTimeout(startTime, 500);
}

var checkTime = function(i){
  if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
  return i;
}

var showDate = function(){
  document.getElementById('date').innerHTML = formatDate(new Date());
}

var formatDate = function(date_input){
  var date = new Date(date_input).toDateString();
  var time = new Date(date_input).toTimeString();
  var dateTime = date.substr(0, date.length-4) + time.substr(0, time.length-18)
  return dateTime
}

var giveDay = function(dateString){
  return dateString.slice(0, 3)
}

var giveDate = function(dateString){
  return dateString.slice(4, 10);
}

var giveTime = function(dateString){

  return dateString.slice(11,16);
}

var datePicker = function(){
  $('.date-picker').datetimepicker();
}
