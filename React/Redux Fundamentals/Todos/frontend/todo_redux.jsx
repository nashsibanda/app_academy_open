import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from "./components/root";
import { allTodos, stepsByTodoId } from "./reducers/selectors";

document.addEventListener("DOMContentLoaded", function() {
  const rootElement = document.getElementById("main-app-container");
  ReactDOM.render(<Root store={configureStore} />, rootElement);
});
