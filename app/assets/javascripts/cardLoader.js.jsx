
var renderReactEvents = function(data){
  if (data.length > 0){
    React.render(<EventCardContainer events={data}/>, document.getElementById('content'));
  }
}

var renderReactPeople = function(data){
  if (data.length > 0){
    React.render(<PersonCardContainer people={data}/>, document.getElementById('content'));
  }
}

var getEvents = function(){
  $.get( "/events/cards.json", function( data ) {
    renderReactEvents(data);
  });
}

var getMeetups = function(){
  $.get( "/meetups/cards.json", function( data ) {
    renderReactEvents(data);
  });
}

var getMentors = function(){
  console.log("in getMentors")
  $.get( "/mentors.json", function( data ) {
    renderReactPeople(data);
  });
}

var getToday = function(){
  $.get( "/cards.json", function( data ) {
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
    setTimeout(function(){ cycleCardView(counter); }, 10000);
  }
}
