import React from "react";
import PokemonIndexItem from "./pokemon_index_item";

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
    this.pokemonItems = this.pokemonItems.bind(this);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  pokemonItems() {
    return this.props.pokemon.map(poke => (
      <PokemonIndexItem key={poke.id} pokemon={poke} />
    ));
  }

  render() {
    return <ul>{this.pokemonItems()}</ul>;
  }
}

export default PokemonIndex;
