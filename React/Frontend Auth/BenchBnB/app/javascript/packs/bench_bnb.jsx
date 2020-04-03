import React from "react";
import ReactDOM from "react-dom";
import { login, signup } from "../frontend/util/session_api_util";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  window.testuser = { username: "testnash", password: "testnash" };
  window.newuser = {
    username: "testnash4",
    password: "testnash4",
    email: "testnash4",
  };
  window.login = login;
  window.signup = signup;
  ReactDOM.render(<h2>Welcome to BenchBnB</h2>, root);
});
