import React from "react";

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestOnePokemon(this.props.match.params.pokemonId);
  }

  componentDidUpdate(prevProps) {
    console.log("update!!");
    console.log("prev-id = " + prevProps.match.params.pokemonId);
    if (
      prevProps.match.params.pokemonId !== this.props.match.params.pokemonId
    ) {
      this.props.requestOnePokemon(this.props.match.params.pokemonId);
    }
  }

  render() {
    console.log("Render called");

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
    // console.log(this.props.pokemon);
    return (
      <section className="pokemon-detail">
        <img src={image_url}></img>
        <h2>{name}</h2>
        <ul>
          <li>Type: {poke_type}</li>
          <li>Attack: {attack}</li>
          <li>Defense: {defense}</li>
          <li>Moves: {moves}</li>
        </ul>
      </section>
    );
  }
}

export default PokemonDetail;
