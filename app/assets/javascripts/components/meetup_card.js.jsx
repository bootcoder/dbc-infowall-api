var MeetupCard = React.createClass({
  getInitialState: function(){
    return { events: this.props.events }
  },

  render: function() {
    return (
      <div>
        <MeetupImage />
        <MeetupDate />
        <MeetupDesc />
      </div>
    )
  }
});
