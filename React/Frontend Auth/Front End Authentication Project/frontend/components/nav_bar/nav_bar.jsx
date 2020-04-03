import React from "react";
import { Link } from "react-router-dom";

export default ({ currentUser, logout }) => {
  const display = (
    <div>
      <Link className="btn" to="/signup">
        Sign Up
      </Link>
      <Link className="btn" to="/login">
        Log In
      </Link>
    </div>
  );

  return (
    <header className="nav-bar">
      <h1 className="logo">
        <a href="#">BLUEBIRD</a>
      </h1>
      <div>{display}</div>
    </header>
  );
};
