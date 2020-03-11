import {
  RECEIVE_STEP,
  RECEIVE_STEPS,
  REMOVE_STEP
} from "../actions/step_actions";

const initialState = {};

const stepsReducer = (state = initialState, action) => {
  switch (action.type) {
    case RECEIVE_STEPS:
      const receivedSteps = {};
      action.steps.forEach((step, index) => {
        receivedSteps[step.id] = step;
      });
      return receivedSteps;
    case RECEIVE_STEP:
      const receivedStep = { [action.step.id]: action.step };
      const newState = Object.assign({}, state, receivedStep);
      // newState[action.step.id] = receivedStep;
      return newState;
    case REMOVE_STEP:
      const shortenedSteps = Object.assign({}, state);
      delete shortenedSteps[action.step.id];
      return shortenedSteps;
    default:
      return state;
  }
};

export default stepsReducer;
