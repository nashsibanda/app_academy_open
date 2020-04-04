import React from "react";

class BenchIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { id, description, lat, lng } = this.props.bench;
    return (
      <li className="bench-index-item">
        <h3>Bench No. {id}</h3>
        <p>Description: {description}</p>
        <p>Latitude: {lat}</p>
        <p>Longitude: {lng}</p>
      </li>
    );
  }
}

export default BenchIndexItem;
