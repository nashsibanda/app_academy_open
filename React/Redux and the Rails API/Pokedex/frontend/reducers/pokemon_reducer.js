import {
  RECEIVE_ALL_POKEMON,
  RECEIVE_ONE_POKEMON,
  RECEIVE_NEW_POKEMON
} from "../actions/pokemon_actions.js";

const pokemonReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return Object.assign({}, action.pokemon, state);
    case RECEIVE_ONE_POKEMON:
      const receivedPokemon = action.pokemonAndItems.pokemon;
      return Object.assign({}, state, {
        [receivedPokemon.id]: receivedPokemon
      });
    case RECEIVE_NEW_POKEMON:
      const newPokemon = { [action.pokemon.id]: action.pokemon };
      return Object.assign({}, state, newPokemon);
    default:
      return state;
  }
};

export default pokemonReducer;
