import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import APIUtil from "./util/api_util";
import Root from "./components/root";
import { HashRouter, Route } from "react-router-dom";
import { requestOnePokemon } from "./actions/pokemon_actions";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();
  window.APIUtil = APIUtil;
  window.store = store;
  window.requestOnePokemon = requestOnePokemon;
  ReactDOM.render(<Root store={store} />, root);
});
