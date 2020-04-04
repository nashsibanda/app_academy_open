export default class MarkerManager {
  constructor(map) {
    this.map = map;
    this.markers = {};
  }

  updateMarkers(benches) {
    console.log("time to update");
    const markers = this.markers;
    Object.keys(benches).forEach(benchId => {
      if (!markers[benchId]) {
        this.createMarkerFromBench(benches[benchId]);
      }
    });
    Object.keys(markers).forEach(markerId => {
      if (!benches[markerId]) {
        this.removeMarker(markers[markerId], markerId);
      }
    });
  }

  createMarkerFromBench(bench) {
    const marker = new google.maps.Marker({
      position: Object.assign({}, { lat: bench.lat, lng: bench.lng }),
      title: `Bench No. ${bench.id}`,
    });
    marker.setMap(this.map);
    this.markers[bench.id] = marker;
  }

  removeMarker(marker, markerId) {
    marker.setMap(null);
    delete this.markers[markerId];
  }
}
