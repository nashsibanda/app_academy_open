import { connect } from "react-redux";
import BenchShow from "./bench_show";
import { fetchBench } from "../../actions/bench_actions";

const mapStateToProps = (state, { match }) => {
  const benchId = parseInt(match.params.benchId);
  const bench = state.entities.benches[benchId];
  return {
    benches: { [benchId]: bench },
    bench,
    benchId,
    reviews: state.entities.reviews,
  };
};

const mapDispatchToProps = dispatch => ({
  fetchBench: benchId => dispatch(fetchBench(benchId)),
});

export default connect(mapStateToProps, mapDispatchToProps)(BenchShow);
