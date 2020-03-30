import React from "react";
import ItemDetailContainer from "./../items/item_detail_container";
import { Link, Route } from "react-router-dom";
import LoadingContainer from "../ui/loading";

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
    if (!this.props.pokemon || !this.props.pokemon.moves) {
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
      <div>
        {this.props.loading ? (
          <LoadingContainer />
        ) : (
          <section className="pokemon-detail">
            <img className="pokemon-main-image" src={image_url}></img>
            <h2>{name}</h2>
            <ul className="pokemon-stats">
              <li>
                <span className="stats-label">Type:</span>
                <span className="stats-value">{poke_type}</span>
              </li>
              <li>
                <span className="stats-label">Attack:</span>
                <span className="stats-value">{attack}</span>
              </li>
              <li>
                <span className="stats-label">Defense:</span>
                <span className="stats-value">{defense}</span>
              </li>
              <li>
                <span className="stats-label">Moves:</span>
                <span className="stats-value">{moves.join(", ")}</span>
              </li>
            </ul>
            <h3>Items</h3>
            <ul className="pokemon-items">
              {this.props.items.map(item => {
                return (
                  <li key={item.id + item.name}>
                    <Link to={`/pokemon/${id}/item/${item.id}`}>
                      <img src={item.image_url}></img>
                      <div className="pokemon-item-name">{item.name}</div>
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
        )}
      </div>
    );
  }
}

export default PokemonDetail;
