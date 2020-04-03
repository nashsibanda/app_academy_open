import { signup } from "../../actions/session_actions";
import { connect } from "react-redux";
import SessionForm from "./session_form";

const mapStateToProps = (state, ownProps) => ({
  errors: state.errors.session,
  loggedIn: Boolean(state.session.id),
  formType: "signup",
});

const mapDispatchToProps = (dispatch, ownProps) => ({
  processForm: user => dispatch(signup(user)),
});

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);
