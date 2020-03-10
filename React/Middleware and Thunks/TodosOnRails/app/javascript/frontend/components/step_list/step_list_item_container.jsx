import { connect } from "react-redux";
import StepListItem from "./step_list_item";
import { removeStep, updateStep, deleteStep } from "../../actions/step_actions";

const mapDispatchToProps = dispatch => ({
  removeStep: step => dispatch(removeStep(step)),
  updateStep: step => dispatch(updateStep(step)),
  deleteStep: step => dispatch(deleteStep(step))
});

export default connect(null, mapDispatchToProps)(StepListItem);
