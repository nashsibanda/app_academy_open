import React from "react";

import GiphysIndexItem from "./giphys_index_item";

class GiphysIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { giphys } = this.props;
    return (
      <ul className="giphys-index-list">
        {giphys.map(giphy => {
          return <GiphysIndexItem giphy={giphy} key={giphy.id} />;
        })}
      </ul>
    );
  }
}

export default GiphysIndex;
