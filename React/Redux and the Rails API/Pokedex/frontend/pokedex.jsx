import React from "react";
import ReactDOM from "react-dom";

class Tester extends React.Component {
  render() {
    return <h1>All working!</h1>;
  }
}

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Tester />, root);
});
