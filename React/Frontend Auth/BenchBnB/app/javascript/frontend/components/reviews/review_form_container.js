import { connect } from "react-redux";
import ReviewForm from "./review_form";
import { createReview } from "../../actions/review_actions";

const mapStateToProps = state => ({
  userId: state.session.id,
});

const mapDispatchToProps = dispatch => ({
  createReview: formReview => dispatch(createReview(formReview)),
});

export default connect(mapStateToProps, mapDispatchToProps)(ReviewForm);
