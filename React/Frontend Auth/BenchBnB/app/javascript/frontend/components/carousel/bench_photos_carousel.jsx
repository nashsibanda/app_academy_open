import React from "react";
import { Carousel } from "react-responsive-carousel";
import "react-responsive-carousel/lib/styles/carousel.min.css";

class BenchPhotosCarousel extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <Carousel>
        {this.props.bench.photoUrls.map(url => {
          return (
            <div key={url}>
              <img src={url} />
              <p className="legend">Photo</p>
            </div>
          );
        })}
      </Carousel>
    );
  }
}

export default BenchPhotosCarousel;
