var MeetupContainer = React.createClass({
  getInitialState: function(){
    return { events: this.props.events }
  },

  render: function() {
    var events = this.props.events;
    return (
      <div className="row">
        {events.map(function(event){
          return <MeetupCard key={event.id} event={event} />;
        })}
      </div>
    )
  }
});
