
var renderReact = function(data){
  React.render(<CardContainer events={data}/>, document.getElementById('content'));
}

var getEvents = function(){
  $.get( "/events/cards.json", function( data ) {
    renderReact(data);
  });
}


var getMeetups = function(){
  $.get( "/meetups/cards.json", function( data ) {
    renderReact(data);
  });
}

var getToday = function(){
  $.get( "/cards.json", function( data ) {
    console.log(data);
    renderReact(data);
  });
}

var cycleCardView = function(counter){
  console.log(counter);
  if (counter === 0) {
    counter += 1;
    getMeetups();
    getCardsIf(counter);
  } else if (counter === 1) {
    counter += 1;
    getEvents();
    getCardsIf(counter);
  } else if (counter === 2) {
    counter = 0;
    getToday();
    getCardsIf(counter);
  }
}

var getCardsIf = function(counter){
  if (window.location.pathname === "/events/cards"){
    getEvents();
  } else if (window.location.pathname === "/meetups/cards"){
    getMeetups();
  } else if (window.location.pathname === "/cards" || window.location.pathname === '/') {
    setTimeout(function(){ cycleCardView(counter); }, 10000);
  }
}
