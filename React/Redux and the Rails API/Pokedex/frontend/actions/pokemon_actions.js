export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_ONE_POKEMON = "RECEIVE_ONE_POKEMON";
export const RECEIVE_NEW_POKEMON = "RECEIVE_NEW_POKEMON";
export const RECEIVE_POKEMON_ERRORS = "RECEIVE_POKEMON_ERRORS";
export const START_LOADING_ALL_POKEMON = "START_LOADING_ALL_POKEMON";
export const START_LOADING_ONE_POKEMON = "START_LOADING_ONE_POKEMON";
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

export const startLoadingAllPokemon = () => {
  return {
    type: START_LOADING_ALL_POKEMON
  };
};

export const startLoadingOnePokemon = () => {
  return {
    type: START_LOADING_ONE_POKEMON
  };
};

export const requestAllPokemon = () => dispatch => {
  dispatch(startLoadingAllPokemon());
  APIUtil.fetchAllPokemon().then(pokemon =>
    dispatch(receiveAllPokemon(pokemon))
  );
};

export const requestOnePokemon = id => dispatch => {
  dispatch(startLoadingOnePokemon());
  APIUtil.fetchOnePokemon(id).then(pokemon => {
    dispatch(receiveOnePokemon(pokemon));
    return pokemon;
  });
};

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
