import { connect } from "react-redux";
import {
  receiveStep,
  fetchSteps,
  createStep
} from "../../actions/step_actions";
import StepList from "./step_list";
import { stepsByTodoId } from "../../reducers/selectors";

const mapStateToProps = (state, { todo_id }) => ({
  steps: stepsByTodoId(state, todo_id),
  errors: state.errors,
  todo_id
});

const mapDispatchToProps = dispatch => ({
  receiveStep: step => dispatch(receiveStep(step)),
  fetchSteps: todo_id => dispatch(fetchSteps(todo_id)),
  createStep: step => dispatch(createStep(step))
});

export default connect(mapStateToProps, mapDispatchToProps)(StepList);
