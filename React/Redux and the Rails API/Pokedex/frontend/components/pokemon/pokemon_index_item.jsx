import React from "react";
import { Link } from "react-router-dom";

const PokemonIndexItem = props => {
  const { id, name, image_url } = props.pokemon;
  return (
    <li>
      <Link to={`/pokemon/${id}`}>
        {name} - <img src={image_url} width={40}></img>
      </Link>
    </li>
  );
};

export default PokemonIndexItem;
