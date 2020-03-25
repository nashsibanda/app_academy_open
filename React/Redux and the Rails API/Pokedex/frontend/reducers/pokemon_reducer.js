import {
  RECEIVE_ALL_POKEMON,
  RECEIVE_ONE_POKEMON
} from "../actions/pokemon_actions.js";

const pokemonReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return Object.assign({}, state, action.pokemon);
    case RECEIVE_ONE_POKEMON:
      const receivedPokemon = action.pokemonAndItems.pokemon;
      return Object.assign({}, state, {
        [receivedPokemon.id]: receivedPokemon
      });
    default:
      return state;
  }
};

export default pokemonReducer;
