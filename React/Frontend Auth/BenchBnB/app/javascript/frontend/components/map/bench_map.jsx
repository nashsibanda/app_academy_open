import React from "react";

class BenchMap extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    const mapOptions = {
      center: {
        lat: 36.371388,
        lng: 140.476434,
      },
      zoom: 13,
    };

    this.map = new google.maps.Map(this.mapNode, mapOptions);
  }

  render() {
    return <div id="map-container" ref={map => (this.mapNode = map)}></div>;
  }
}

export default BenchMap;
