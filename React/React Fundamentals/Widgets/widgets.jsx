import React from "react";
import ReactDOM from "react-dom";

function Root(props) {
  return <div>Hello</div>;
}

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  ReactDOM.render(<Root />, rootEl);
});
