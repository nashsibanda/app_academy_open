import { RECEIVE_BOUNDS } from "../actions/filter_actions";

const filterReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_BOUNDS:
      return Object.assign({}, state, { bounds: action.bounds });
    default:
      return state;
  }
};

export default filterReducer;
