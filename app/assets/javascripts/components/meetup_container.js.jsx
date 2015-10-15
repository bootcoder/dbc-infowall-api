var MeetupContainer = React.createClass({
  getInitialState: function(){
    return { events: this.props.events }
  },

  render: function() {
    console.log("this props in meetupcard comp");
    console.log(this.props)
    var list = this.props.events.map(function(event){
      return <MeetupCard key={event.id} event={event} />
    })
    return (
      <div>
        <div>
          {list}
        </div>
        <MeetupImage />
        <MeetupDate />
        <MeetupDesc />
      </div>
    )
  }
});
