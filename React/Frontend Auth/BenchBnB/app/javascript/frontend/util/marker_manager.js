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
  }

  createMarkerFromBench(bench) {
    const marker = new google.maps.Marker({
      position: Object.assign({}, { lat: bench.lat, lng: bench.lng }),
      title: `Bench No. ${bench.id}`,
    });
    marker.setMap(this.map);
    this.markers[bench.id] = marker;
  }
}
