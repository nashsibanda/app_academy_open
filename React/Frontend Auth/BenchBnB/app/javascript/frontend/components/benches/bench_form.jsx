import React from "react";
import { withRouter } from "react-router-dom";

class BenchForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      description: "",
      lat: this.props.lat,
      lng: this.props.lng,
      seating: "",
    };
    this.updateProperty = this.updateProperty.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  updateProperty(property) {
    return e => this.setState({ [property]: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    const formBench = Object.assign({}, { bench: this.state });
    this.props.createBench(formBench);
    this.redirectToSearch();
  }

  redirectToSearch() {
    this.props.history.push("/");
  }

  render() {
    return (
      <form className="bench-form" onSubmit={this.handleSubmit}>
        <input
          type="text"
          placeholder="Bench Description..."
          value={this.state.description}
          onChange={this.updateProperty("description")}
        ></input>
        <input
          type="number"
          placeholder="Latitude..."
          value={this.state.lat}
          onChange={this.updateProperty("lat")}
          disabled={true}
        ></input>
        <input
          type="number"
          placeholder="Longitude..."
          value={this.state.lng}
          onChange={this.updateProperty("lng")}
          disabled={true}
        ></input>
        <input
          type="number"
          placeholder="Number of seats..."
          value={this.state.seating}
          onChange={this.updateProperty("seating")}
        ></input>
        <button type="submit">Add Bench</button>
      </form>
    );
  }
}

export default withRouter(BenchForm);
