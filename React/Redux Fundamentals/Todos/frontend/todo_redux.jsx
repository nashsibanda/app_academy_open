import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from "./components/root";
import allTodos from "./reducers/selectors";

document.addEventListener("DOMContentLoaded", function() {
  const rootElement = document.getElementById("content");
  ReactDOM.render(<Root store={configureStore} />, rootElement);
});

// window.store = configureStore;
// window.allTodos = allTodos;
