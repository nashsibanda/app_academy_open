const DOMNodeCollection = require("./dom_node_collection");

window.$1 = (argument) => {
  if (typeof argument === "string") {
    const nodeList = document.querySelectorAll(argument);
    const elementArray = Array.from(nodeList);
    return new DOMNodeCollection(elementArray);
  } else if (argument instanceof HTMLElement) {
    const HTMLArray = [argument];
    return new DOMNodeCollection(HTMLArray);
  }
}

window.logAThing = () => {
  console.log("HEY MOFO");
}