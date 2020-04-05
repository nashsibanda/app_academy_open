import { connect } from "react-redux";
import { fetchReviews, clearReviews } from "./../../actions/review_actions";
import ReviewIndex from "./review_index.jsx";

const mapStateToProps = state => ({
  reviews: state.entities.reviews,
});

const mapDispatchToProps = dispatch => ({
  fetchReviews: (reviewType, typeId) =>
    dispatch(fetchReviews(reviewType, typeId)),
  clearReviews: () => dispatch(clearReviews()),
});

export default connect(mapStateToProps, mapDispatchToProps)(ReviewIndex);
