import { RECEIVE_ERRORS, CLEAR_ERRORS } from "./../actions/error_actions";

const initialState = ["Test error!", "Error 2", "This is another error"];

const errorReducer = (state = initialState, action) => {
  switch (action.type) {
    case RECEIVE_ERRORS:
      return action.errors;
    case CLEAR_ERRORS:
      return [];
    default:
      return state;
  }
};

export default errorReducer;
