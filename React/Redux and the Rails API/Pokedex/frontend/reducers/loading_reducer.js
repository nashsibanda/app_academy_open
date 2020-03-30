import {
  START_LOADING_ALL_POKEMON,
  START_LOADING_ONE_POKEMON,
  RECEIVE_ALL_POKEMON,
  RECEIVE_ONE_POKEMON,
  RECEIVE_NEW_POKEMON,
  RECEIVE_POKEMON_ERRORS
} from "./../actions/pokemon_actions";

const loadingReducer = (state = {}, action) => {
  switch (action.type) {
    case START_LOADING_ALL_POKEMON:
      return Object.assign({}, state, { indexLoading: true });
    case START_LOADING_ONE_POKEMON:
    case RECEIVE_NEW_POKEMON:
      return Object.assign({}, state, { detailLoading: true });
    case RECEIVE_ALL_POKEMON:
      return Object.assign({}, state, { indexLoading: false });
    case RECEIVE_ONE_POKEMON:
    case RECEIVE_POKEMON_ERRORS:
      return Object.assign({}, state, { detailLoading: false });
    default:
      return state;
  }
};

export default loadingReducer;
