import {
  RECEIVE_STEP,
  RECEIVE_STEPS,
  REMOVE_STEP
} from "../actions/step_actions";

const initialState = {
  1: {
    id: 1,
    title: "Walk to store",
    body: "Go via the park, not the main road",
    done: false,
    todo_id: 8
  },
  2: {
    id: 2,
    title: "Buy soap",
    body: "",
    done: false,
    todo_id: 8
  }
};

const stepsReducer = (state = initialState, action) => {
  switch (action.type) {
    case RECEIVE_STEPS:
      const receivedSteps = {};
      action.steps.forEach((step, index) => {
        receivedSteps[index] = step;
      });
      return receivedSteps;
    case RECEIVE_STEP:
      const receivedStep = { [action.step.id]: action.step };
      return Object.assign({}, state, receivedStep);
    case REMOVE_STEP:
      const shortenedSteps = Object.assign({}, state);
      delete shortenedSteps[action.step.id];
      return shortenedSteps;
    default:
      return state;
  }
};

export default stepsReducer;
