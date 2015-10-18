var CardContainer = React.createClass({
  getInitialState: function(){
    return { events: this.props.events }
  },
  render: function() {
    var events = this.props.events;
    return (
      <div className=''>
      {events.map(function(event, index){
        return ( <Card key={event.id} event={event} /> )
      })}
      </div>
    )
  }
});
