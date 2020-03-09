import React from "react";
import ReactDOM from "react-dom";
import configureStore from "../frontend/store/store";
import Root from "../frontend/components/root";
import { fetchTodos } from "./../frontend/actions/todo_actions";

document.addEventListener("DOMContentLoaded", function() {
  const rootElement = document.getElementById("main-app-container");
  ReactDOM.render(<Root store={configureStore} />, rootElement);
});

window.store = configureStore;
window.fetchTodos = fetchTodos;
