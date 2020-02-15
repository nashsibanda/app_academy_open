import React from "react";
import ReactDOM from "react-dom";
import Clock from "./clock";
import Tabs from "./tabs";
import Weather from "./weather";
import Autocomplete from "./autocomplete";
import NamesList from "./mock_data/names";

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
  const autocompleteContent = [""];
  return (
    <main className="rootSection">
      <Clock />
      <Weather />
      <div className="interactive-widgets">
        <Tabs {...tabsContent} />
        <Autocomplete {...NamesList} />
      </div>
    </main>
  );
}

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  ReactDOM.render(<Root />, rootEl);
});
