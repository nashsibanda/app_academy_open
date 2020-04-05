import React from "react";
import MarkerManager from "../../util/marker_manager";
import { withRouter } from "react-router-dom";

const getCoords = latLng => ({
  lat: latLng.lat(),
  lng: latLng.lng(),
});

class BenchMap extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    const mapOptions = {
      center: {
        lat: 36.371388,
        lng: 140.476434,
      }, // Mito coordinates
      zoom: 13,
    };

    this.map = new google.maps.Map(this.mapNode, mapOptions);
    this.MarkerManager = new MarkerManager(this.map);
    this.MarkerManager.updateMarkers(this.props.benches);

    this.map.addListener("idle", () => {
      const boundsObj = this.map.getBounds();
      const nEast = boundsObj.getNorthEast().toJSON();
      const sWest = boundsObj.getSouthWest().toJSON();
      const bounds = { northEast: nEast, southWest: sWest };
      this.props.updateBounds(bounds);
    });

    this.map.addListener("click", e => {
      const coords = getCoords(e.latLng);
      this.handleMapClick(coords);
    });
  }

  componentDidUpdate() {
    this.MarkerManager.updateMarkers(this.props.benches);
  }

  handleMapClick(coords) {
    this.props.history.push({
      pathname: "benches/new",
      search: `lat=${coords.lat}&lng=${coords.lng}`,
    });
  }

  render() {
    return <div id="map-container" ref={map => (this.mapNode = map)}></div>;
  }
}

export default withRouter(BenchMap);
