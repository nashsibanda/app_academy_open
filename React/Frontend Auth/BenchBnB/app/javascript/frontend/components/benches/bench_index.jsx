import React from "react";
import BenchIndexItem from "./bench_index_item";

class BenchIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  // componentDidMount() {
  //   this.props.fetchBenches();
  // }

  render() {
    const { benches } = this.props;
    console.log(this.props.benches);
    return (
      <ul className="bench-index">
        {Object.keys(benches).map(id => {
          return <BenchIndexItem bench={benches[id]} key={id} />;
        })}
      </ul>
    );
  }
}

export default BenchIndex;
