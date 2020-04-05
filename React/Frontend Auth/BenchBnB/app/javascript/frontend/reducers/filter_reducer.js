import { RECEIVE_BOUNDS, UPDATE_FILTER } from "../actions/filter_actions";

const initialState = {
  bounds: {},
  minSeating: 1,
  maxSeating: 10,
};

const filterReducer = (state = initialState, action) => {
  Object.freeze(state);
  switch (action.type) {
    // case RECEIVE_BOUNDS:
    //   return Object.assign({}, state, { bounds: action.bounds });
    case UPDATE_FILTER:
      const { filter, value } = action;
      return Object.assign({}, state, { [filter]: value });
    default:
      return state;
  }
};

export default filterReducer;
