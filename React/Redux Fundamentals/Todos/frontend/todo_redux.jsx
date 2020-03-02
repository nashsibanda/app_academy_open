import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import { receiveTodos, receiveTodo } from "./actions/todo_actions";

document.addEventListener("DOMContentLoaded", function() {
  ReactDOM.render(
    <h1>Hello, it's me, React!</h1>,
    document.getElementById("content")
  );
});

window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;

window.store = configureStore;
