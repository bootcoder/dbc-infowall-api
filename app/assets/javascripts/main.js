$(document).ready(function(){
  console.log("Main JS ready");
  startTime();
  showDate();
  datePicker();
  getCardsIf(0);
})


var check_event_row_div = function(idx){
  if ((index % 3) == 0) {
    return '<div class="row">'
  }
}

var check_event_row_end = function(idx){
  console.log("HJH")
  if ((index % 3) == 0) {
   return '</div>'
  }
}




