
var renderReactEvents = function(data){
  React.render(<EventCardContainer events={data}/>, document.getElementById('content'));
}

var renderReactPeople = function(data){
  React.render(<PersonCardContainer people={data}/>, document.getElementById('content'));
}

var getEvents = function(){
  $.get( "/events/cards.json", function( data ) {
    if(data === null || data === undefined || data.length == 0){ return getCalendar(); };
    renderReactEvents(data);
  });
}

var getMeetups = function(){
  $.get( "/meetups/cards.json", function( data ) {
    if(data === null || data === undefined || data.length == 0){ return getCalendar(); };
    renderReactEvents(data);
  });
}

var getMentors = function(){
  $.get( "/mentors.json", function( data ) {
    if(data === null || data === undefined || data.length == 0){ return getCalendar(); };
    renderReactPeople(data);
  });
}

var getToday = function(){
  $.get( "/cards.json", function( data ) {
    if(data === null || data === undefined || data.length == 0){ return getCalendar(); };
    renderReactEvents(data);
  });
}

var getCalendar = function(){
  $.get( "/calendars.json", function( data ) {
    renderReactEvents(data);
  });
}

var cycleCardView = function(counter){
  console.log(counter);
  if (counter === 0) {
    counter += 1;
    getToday();
    getCardsIf(counter);
  } else if (counter === 1) {
    counter += 1;
    getMentors();
    getCardsIf(counter);
  } else if (counter === 2) {
    counter = 0;
    getCalendar();
    getCardsIf(counter);
  }
}

var getCardsIf = function(counter){
  if (window.location.pathname === "/events/cards"){
    getEvents();
  } else if (window.location.pathname === "/meetups/cards"){
    getMeetups();
  } else if (window.location.pathname === "/mentors"){
    getMentors();
  } else if (window.location.pathname === "/cards" || window.location.pathname === '/') {
    setTimeout(function(){ cycleCardView(counter); }, 15000);
  }
}
