import React from "react";
import { Link } from "react-router-dom";

class BenchIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { id, description, lat, lng } = this.props.bench;
    return (
      <li className="bench-index-item">
        <Link to={`/benches/${id}`}>
          <h3>Bench No. {id}</h3>
        </Link>
        <p>Description: {description}</p>
        <p>Latitude: {lat}</p>
        <p>Longitude: {lng}</p>
      </li>
    );
  }
}

export default BenchIndexItem;
