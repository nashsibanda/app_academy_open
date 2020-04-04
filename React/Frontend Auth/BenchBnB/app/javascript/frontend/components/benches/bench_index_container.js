import { fetchBenches } from "../../actions/bench_actions";
import { connect } from "react-redux";
import BenchIndex from "./bench_index";

const mapStateToProps = state => ({
  benches: state.entities.benches,
});

const mapDispatchToProps = dispatch => ({
  fetchBenches: () => dispatch(fetchBenches()),
});

export default connect(mapStateToProps, mapDispatchToProps)(BenchIndex);
