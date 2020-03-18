import React from "react";

class GiphysIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { giphy } = this.props;
    const imageJSON = giphy.images.fixed_height;
    const { height, width, url } = imageJSON;
    return (
      <li>
        {/* {JSON.stringify(Object.keys(giphy.images))} */}
        <img
          className="giphy-result"
          src={url}
          height={height}
          width={width}
        ></img>
      </li>
    );
  }
}

export default GiphysIndexItem;
