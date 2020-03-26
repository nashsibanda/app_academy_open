import { connect } from "react-redux";
import { requestOnePokemon } from "./../../actions/pokemon_actions";
import PokemonDetail from "./pokemon_detail";
import { selectPokemonItems } from "../../reducers/selectors";

const mapStateToProps = (state, ownProps) => {
  const pokemon = state.entities.pokemon[ownProps.match.params.pokemonId];
  return {
    pokemon,
    items: selectPokemonItems(state),
    ui: state.ui
  };
};

const mapDispatchToProps = dispatch => ({
  requestOnePokemon: id => dispatch(requestOnePokemon(id))
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);
