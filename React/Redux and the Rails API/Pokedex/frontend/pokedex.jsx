import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import APIUtil from "./util/api_util";
import { receiveAllPokemon } from "./actions/pokemon_actions";

class Tester extends React.Component {
  render() {
    return <h1>All working!</h1>;
  }
}

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  ReactDOM.render(<Tester />, root);
});

window.APIUtil = APIUtil;
window.receiveAllPokemon = receiveAllPokemon;
