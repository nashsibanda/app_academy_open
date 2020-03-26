import React from "react";
import { connect } from "react-redux";
import { selectPokemonItem } from "./../../reducers/selectors.js";

const mapStateToProps = (state, ownProps) => ({
  item: selectPokemonItem(state, ownProps.match.params.itemId)
});

const ItemDetail = props => {
  return (
    <ul className="item-details">
      <li>Name: {props.item.name}</li>
      <li>Price: {props.item.price}</li>
      <li>Happiness: {props.item.happiness}</li>
    </ul>
  );
};

export default connect(mapStateToProps, null)(ItemDetail);
