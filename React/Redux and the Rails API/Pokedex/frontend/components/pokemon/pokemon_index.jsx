import React from "react";
import PokemonIndexItem from "./pokemon_index_item";
import { Route } from "react-router-dom";
import PokemonDetailContainer from "./pokemon_detail_container";
import PokemonFormContainer from "./pokemon_form_container";

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
    return (
      <section className="pokedex">
        <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
        <Route exact path="/" component={PokemonFormContainer} />
        <aside>
          <ul className="pokemon-list">{this.pokemonItems()}</ul>
        </aside>
      </section>
    );
  }
}

export default PokemonIndex;
