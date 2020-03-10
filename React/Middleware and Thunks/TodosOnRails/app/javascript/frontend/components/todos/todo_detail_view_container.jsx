import { connect } from "react-redux";
import { removeTodo } from "../../actions/todo_actions";
import { receiveSteps } from "../../actions/step_actions";
import TodoDetailView from "./todo_detail_view";

const mapDispatchToProps = dispatch => ({
  receiveSteps: steps_array => dispatch(receiveSteps(steps_array))
});

export default connect(null, mapDispatchToProps)(TodoDetailView);
