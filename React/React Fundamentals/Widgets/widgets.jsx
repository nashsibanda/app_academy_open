import React from "react";
import ReactDOM from "react-dom";
import Clock from "./clock";

function Root(props) {
  return (
    <main className="rootSection">
      <Clock />
    </main>
  );
}

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  ReactDOM.render(<Root />, rootEl);
});
