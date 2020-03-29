export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_ONE_POKEMON = "RECEIVE_ONE_POKEMON";
export const RECEIVE_NEW_POKEMON = "RECEIVE_NEW_POKEMON";
export const RECEIVE_POKEMON_ERRORS = "RECEIVE_POKEMON_ERRORS";
import APIUtil from "../util/api_util";

export const receiveAllPokemon = pokemon => {
  return {
    type: RECEIVE_ALL_POKEMON,
    pokemon
  };
};

export const receiveOnePokemon = response => {
  return {
    type: RECEIVE_ONE_POKEMON,
    pokemonAndItems: response
  };
};

export const receiveNewPokemon = pokemon => {
  return {
    type: RECEIVE_NEW_POKEMON,
    pokemon
  };
};

export const receivePokemonErrors = errors => {
  return {
    type: RECEIVE_POKEMON_ERRORS,
    errors
  };
};

export const requestAllPokemon = () => dispatch =>
  APIUtil.fetchAllPokemon().then(pokemon =>
    dispatch(receiveAllPokemon(pokemon))
  );

export const requestOnePokemon = id => dispatch =>
  APIUtil.fetchOnePokemon(id).then(pokemon => {
    dispatch(receiveOnePokemon(pokemon));
    return pokemon;
  });

export const createPokemon = pokemon => dispatch =>
  APIUtil.postNewPokemon(pokemon).then(
    pokemon => {
      dispatch(receiveNewPokemon(pokemon));
      return pokemon;
    },
    errors => {
      dispatch(receivePokemonErrors(errors.responseJSON));
    }
  );
