import { logout } from "../actions/session_actions";
import { connect } from "react-redux";
import Greeting from "./greeting";

const mapStateToProps = state => {
  const { entities, session } = state;
  return {
    currentUser: entities.users[session.id],
  };
};

const mapDispatchToProps = dispatch => ({
  logout: () => dispatch(logout()),
});

export default connect(mapStateToProps, mapDispatchToProps)(Greeting);
