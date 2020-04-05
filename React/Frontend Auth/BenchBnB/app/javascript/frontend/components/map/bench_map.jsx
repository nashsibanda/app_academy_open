import React from "react";
import MarkerManager from "../../util/marker_manager";
import { withRouter } from "react-router-dom";

const getCoords = latLng => ({
  lat: latLng.lat(),
  lng: latLng.lng(),
});

const mapOptions = {
  center: {
    lat: 36.371388,
    lng: 140.476434,
  }, // Mito coordinates
  zoom: 13,
};

class BenchMap extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    if (this.props.singleBench) {
      // const mapBench = this.props.benches[this.props.benchId];
      // console.log("mapBench below");
      console.log(this.props.bench);
      // mapOptions.center = { lat: mapBench.lat, lng: mapBench.lng };
      // mapOptions.zoom = 16;
    }
    this.map = new google.maps.Map(this.mapNode, mapOptions);
    this.MarkerManager = new MarkerManager(
      this.map,
      this.handleMarkerClick.bind(this)
    );
    if (this.props.singleBench) {
      this.props.fetchBench(this.props.benchId);
    } else {
      this.addMapListeners();
      this.MarkerManager.updateMarkers(this.props.benches);
    }
  }

  componentDidUpdate() {
    if (this.props.singleBench) {
      this.MarkerManager.updateMarkers(this.props.benches);
      this.MarkerManager.centerOnBench();
    } else {
      this.MarkerManager.updateMarkers(this.props.benches);
    }
  }

  addMapListeners() {
    this.map.addListener("idle", () => {
      const boundsObj = this.map.getBounds();
      const nEast = boundsObj.getNorthEast().toJSON();
      const sWest = boundsObj.getSouthWest().toJSON();
      const bounds = { northEast: nEast, southWest: sWest };
      this.props.updateFilter("bounds", bounds);
    });

    this.map.addListener("click", e => {
      const coords = getCoords(e.latLng);
      this.handleMapClick(coords);
    });
  }

  handleMapClick(coords) {
    this.props.history.push({
      pathname: "benches/new",
      search: `lat=${coords.lat}&lng=${coords.lng}`,
    });
  }

  handleMarkerClick(bench) {
    this.props.history.push(`benches/${bench.id}`);
  }

  render() {
    return <div id="map-container" ref={map => (this.mapNode = map)}></div>;
  }
}

export default withRouter(BenchMap);
