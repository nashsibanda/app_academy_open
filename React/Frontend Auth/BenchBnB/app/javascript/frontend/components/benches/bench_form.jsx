import React from "react";

class BenchForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      description: "",
      lat: 0.0,
      lng: 0.0,
      seating: 0,
    };
    this.updateProperty = this.updateProperty.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  updateProperty(property) {
    return e => this.setState({ [property]: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
  }

  render() {
    return (
      <form className="bench-form" onSubmit={this.handleSubmit}>
        <input
          type="text"
          placeholder="Bench Description..."
          onChange={this.updateProperty("description")}
        ></input>
        <input
          type="number"
          placeholder="Latitude..."
          onChange={this.updateProperty("lat")}
        ></input>
        <input
          type="number"
          placeholder="Longitude..."
          onChange={this.updateProperty("lng")}
        ></input>
        <input
          type="number"
          placeholder="Number of seats..."
          onChange={this.updateProperty("seating")}
        ></input>
      </form>
    );
  }
}

export default BenchForm;
