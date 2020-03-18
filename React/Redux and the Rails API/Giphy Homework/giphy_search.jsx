import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from "./components/root";
import APIUtil from "./util/api_util";
import { receiveSearchGiphys } from "./actions/giphy_actions";

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  window.store = store;
  window.APIUtil = APIUtil;
  window.receiveSearchGiphys = receiveSearchGiphys;
});
