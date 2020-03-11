import { FETCHING_OFF, FETCHING_ON } from "./../actions/fetching_actions";

const initialState = {
  fetching: false
};

const fetchingReducer = (state = initialState, action) => {
  switch (action.type) {
    case FETCHING_ON:
      const onState = { fetching: true };
      return onState;
    case FETCHING_OFF:
      const offState = { fetching: false };
      return offState;
    default:
      return state;
  }
};

export default fetchingReducer;
