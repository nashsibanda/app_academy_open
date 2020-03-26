import React from "react";

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
    if (!this.props.pokemon) {
      console.log("no pokemon yet");
      return null;
    }

    const {
      image_url,
      name,
      poke_type,
      attack,
      defense,
      moves
    } = this.props.pokemon;
    console.log(this.props.items);
    return (
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
                <img src={item.image_url}></img>
                <div>{item.name}</div>
              </li>
            );
          })}
        </ul>
      </section>
    );
  }
}

export default PokemonDetail;
