import React from "react";
import BenchMap from "./../map/bench_map";
import { Link } from "react-router-dom";
import ReviewIndexContainer from "./../reviews/review_index_container";

class BenchShow extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { benchId, benches, fetchBench, bench } = this.props;
    return (
      <div className="bench-show">
        <Link to="/">Back to Index</Link>
        <BenchMap
          benches={benches}
          bench={bench}
          benchId={benchId}
          fetchBench={fetchBench}
          singleBench={true}
        />
        <ReviewIndexContainer benchId={benchId} />
      </div>
    );
  }
}

export default BenchShow;
