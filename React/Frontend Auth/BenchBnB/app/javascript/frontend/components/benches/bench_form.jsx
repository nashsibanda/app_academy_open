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
      photos: [],
      photoUrls: [],
    };
    this.updateProperty = this.updateProperty.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handlePhotos = this.handlePhotos.bind(this);
  }

  updateProperty(property) {
    return e => this.setState({ [property]: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    const benchFormData = new FormData();
    benchFormData.append("bench[description]", this.state.description);
    benchFormData.append("bench[lat]", this.state.lat);
    benchFormData.append("bench[lng]", this.state.lng);
    benchFormData.append("bench[seating]", this.state.seating);
    const { photos } = this.state;
    if (photos.length > 0) {
      for (let i = 0; i < photos.length; i++) {
        benchFormData.append("bench[photos][]", photos[i]);
      }
    }
    // const formBench = Object.assign({}, { bench: this.state });
    console.log(benchFormData);
    this.props.createBench(benchFormData);
    this.redirectToSearch();
  }

  handlePhotos(e) {
    const photoFilesArray = Array.from(e.target.files);

    function readUrl(file) {
      return new Promise(function (resolve, reject) {
        const reader = new FileReader();
        reader.onload = function () {
          resolve(reader.result);
        };
        reader.onerror = reader.onabort = reject;
        reader.readAsDataURL(file);
      });
    }
    function readManyUrls(files) {
      return Promise.all(files.map(readUrl));
    }

    readManyUrls(photoFilesArray).then(result => {
      this.setState({ photos: photoFilesArray, photoUrls: result }, () => {
        console.log(this.state.photos);
      });
    });
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
        <input type="file" onChange={this.handlePhotos} multiple></input>
        <button type="submit">Add Bench</button>
      </form>
    );
  }
}

export default withRouter(BenchForm);
