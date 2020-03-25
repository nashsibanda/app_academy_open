export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_ONE_POKEMON = "RECEIVE_ONE_POKEMON";
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

export const requestAllPokemon = () => dispatch =>
  APIUtil.fetchAllPokemon().then(pokemon =>
    dispatch(receiveAllPokemon(pokemon))
  );

export const requestOnePokemon = id => dispatch =>
  APIUtil.fetchOnePokemon(id).then(pokemon =>
    dispatch(receiveOnePokemon(pokemon))
  );
