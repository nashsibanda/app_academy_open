import { RECEIVE_ONE_POKEMON } from "./../actions/pokemon_actions.js";

const itemsReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_ONE_POKEMON:
      return Object.assign({}, state, action.pokemonAndItems.items);
    default:
      return state;
  }
};

export default itemsReducer;
