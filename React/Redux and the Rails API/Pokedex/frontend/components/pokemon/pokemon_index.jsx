import React from "react";

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const { pokemon } = this.props;
    return (
      <ul>
        {pokemon.map(pokemon => {
          return (
            <li key={pokemon.id}>
              {pokemon.name} - <img src={pokemon.image_url} width={40}></img>
            </li>
          );
        })}
      </ul>
    );
  }
}

export default PokemonIndex;
