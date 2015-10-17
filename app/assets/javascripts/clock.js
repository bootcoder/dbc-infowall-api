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
  return date.substr(0, date.length-4)
}

var spaceDay = function(dateString){
  var output = [dateString.slice(0, 3), "\n\r".html, dateString.slice(3)].join('');
  console.log(output);
  return output;
}
