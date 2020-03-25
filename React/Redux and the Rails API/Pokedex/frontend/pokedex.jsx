import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import APIUtil from "./util/api_util";
import Root from "./components/root";
import { HashRouter, Route } from "react-router-dom";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();
  ReactDOM.render(<Root store={store} />, root);
});
