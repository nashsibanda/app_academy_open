import React from "react";
import ItemDetailContainer from "./../items/item_detail_container";
import { Link, Route } from "react-router-dom";

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestOnePokemon(this.props.match.params.pokemonId);
  }

  componentDidUpdate(prevProps) {
    if (
      prevProps.match.params.pokemonId !== this.props.match.params.pokemonId
    ) {
      this.props.requestOnePokemon(this.props.match.params.pokemonId);
    }
  }

  render() {
    if (!this.props.pokemon.moves) {
      console.log("no pokemon yet");
      return null;
    }

    const {
      image_url,
      name,
      poke_type,
      attack,
      defense,
      moves,
      id
    } = this.props.pokemon;
    return (
      <main className="pokemon-detail">
        <section className="pokemon-detail">
          <img src={image_url}></img>
          <h2>{name}</h2>
          <ul>
            <li>Type: {poke_type}</li>
            <li>Attack: {attack}</li>
            <li>Defense: {defense}</li>
            <li>Moves: {moves.join(", ")}</li>
          </ul>
          <ul className="pokemon-items">
            {this.props.items.map(item => {
              return (
                <li key={item.id + item.name}>
                  <Link to={`/pokemon/${id}/item/${item.id}`}>
                    <img src={item.image_url}></img>
                    <div>{item.name}</div>
                  </Link>
                </li>
              );
            })}
          </ul>
          <Route
            path="/pokemon/:pokemonId/item/:itemId"
            component={ItemDetailContainer}
          />
        </section>
      </main>
    );
  }
}

export default PokemonDetail;
