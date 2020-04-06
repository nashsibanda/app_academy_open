import React from "react";
import BenchMap from "./../map/bench_map";
import { Link } from "react-router-dom";
import ReviewIndexContainer from "./../reviews/review_index_container";

class BenchShow extends React.Component {
  constructor(props) {
    super(props);
    this.props.fetchBench(this.props.benchId);
    this.bench = this.props.benches[this.props.benchId];
  }

  render() {
    const { benchId, benches, fetchBench } = this.props;
    return (
      <div className="bench-show">
        <Link to="/">Back to Index</Link>
        <BenchMap
          benches={benches}
          bench={this.bench}
          benchId={benchId}
          fetchBench={fetchBench}
          singleBench={true}
        />
        <img src={this.bench.photoUrls[0]} />
        <ReviewIndexContainer benchId={benchId} />
      </div>
    );
  }
}

export default BenchShow;
