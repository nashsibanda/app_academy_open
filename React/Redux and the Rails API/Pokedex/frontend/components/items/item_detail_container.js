import React from "react";
import { connect } from "react-redux";
import { selectPokemonItem } from "./../../reducers/selectors.js";

const mapStateToProps = (state, ownProps) => ({
  item: selectPokemonItem(state, ownProps.match.params.itemId)
});

const ItemDetail = props => {
  return (
    <ul className="item-details">
      <li>
        <span className="item-label">Name:</span>
        <span className="item-value">{props.item.name}</span>
      </li>
      <li>
        <span className="item-label">Price:</span>
        <span className="item-value">{props.item.price}</span>
      </li>
      <li>
        <span className="item-label">Happiness:</span>
        <span className="item-value">{props.item.happiness}</span>
      </li>
    </ul>
  );
};

export default connect(mapStateToProps, null)(ItemDetail);
