var MeetupContainer = React.createClass({
  getInitialState: function(){
    return { events: this.props.events }
  },

  render: function() {
    var events = this.props.events;
    return (
      <div className=''>
      {events.map(function(event, index){
        return ( <MeetupCard key={event.id} event={event} /> )
      })}
      </div>
    )



    // return (
    //   <div className="">
    //     {events.map(function(event, index){
    //       if (index % 4 == 0) {
    //         return (
    //           <div className="row max-height-500px">
    //             <MeetupCard key={event.id} event={event} />
    //           </div>
    //           )
    //       } else if ( index % 4 != 0) {
    //         return (
    //           <div className="white-text max-height-500px" >
    //             <MeetupCard key={event.id} event={event} />
    //           </div>
    //         )
    //       }
    //     })}
    //   </div>
    // )
  }
});

var MeetupRow = React.createClass({
  render: function(){
    return ( <h1> lalskdfj </h1> )
  }
})
