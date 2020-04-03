import React from "react";
import ReactDOM from "react-dom";
import configureStore from "../frontend/store/store";
import Root from "../frontend/components/root";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();
  // window.getState = store.getState;
  // window.dispatch = store.dispatch;
  // window.testuser = { username: "testnash", password: "testnash" };
  // window.newuser = {
  //   username: "testnash4",
  //   password: "testnash4",
  //   email: "testnash4",
  // };
  // window.login = login;
  // window.signup = signup;
  ReactDOM.render(<Root store={store} />, root);
});
