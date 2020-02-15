import React from "react";

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = { date: new Date() };
    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    this.intervalHandle = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.intervalHandle);
  }

  tick() {
    this.setState({ date: new Date() });
  }

  render() {
    const { date } = this.state;
    return (
      <div className="widget-container">
        <h2>Clock</h2>
        <div className="clock-widget widget">
          <section className="clock-widget-time">
            <span>Time:</span>
            <span>{date.toTimeString().slice(0, 8)}</span>
          </section>
          <section className="clock-widget-date">
            <span>Date:</span>
            <span>{date.toDateString()}</span>
          </section>
        </div>
      </div>
    );
  }
}

export default Clock;
