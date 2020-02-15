import React from "react";
import ReactDOM from "react-dom";
import Clock from "./clock";
import Tabs from "./tabs";

function Root(props) {
  const tabsContent = [
    {
      title: "One",
      content: "This is the first page."
    },
    {
      title: "Two",
      content: "Here is the second page."
    },
    {
      title: "Three",
      content: "And finally, the third page."
    },
    {
      title: "Four",
      content: "Surprise! A fourth tab!"
    }
  ];
  return (
    <main className="rootSection">
      <Clock />
      <div className="interactive-widgets">
        <Tabs {...tabsContent} />
      </div>
    </main>
  );
}

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  ReactDOM.render(<Root />, rootEl);
});
