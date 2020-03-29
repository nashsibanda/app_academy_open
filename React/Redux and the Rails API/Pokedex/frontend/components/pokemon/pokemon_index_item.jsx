import React from "react";
import { Link } from "react-router-dom";

const PokemonIndexItem = props => {
  const { id, name, image_url } = props.pokemon;
  return (
    <li>
      <Link to={`/pokemon/${id}`}>
        <span>{id}</span> <img src={image_url}></img> <span>{name}</span>
      </Link>
    </li>
  );
};

export default PokemonIndexItem;
