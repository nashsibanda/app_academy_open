import { TOGGLE_STEPS } from "./../actions/prefs_actions.js";

const initialState = {
  showSteps: false
};

const prefsReducer = (state = initialState, action) => {
  switch (action.type) {
    case TOGGLE_STEPS:
      const newState = Object.assign({}, state);
      newState.showSteps = !newState.showSteps;
      return newState;
    default:
      return state;
  }
};

export default prefsReducer;
