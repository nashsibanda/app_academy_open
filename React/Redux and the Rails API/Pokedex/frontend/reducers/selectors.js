export const selectAllPokemon = state => {
  return Object.values(state.entities.pokemon);
};

export const selectPokemonItems = state => {
  return Object.values(state.entities.items);
};

export const selectPokemonItem = (state, itemId) => {
  return state.entities.items[itemId];
};
