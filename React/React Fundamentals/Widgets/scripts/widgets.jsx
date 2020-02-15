import React from "react";
import ReactDOM from "react-dom";
import Clock from "./clock";
import Tabs from "./tabs";
import Weather from "./weather";

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
      <Weather />
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
