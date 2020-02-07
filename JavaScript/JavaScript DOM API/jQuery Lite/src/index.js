const DOMNodeCollection = require("./dom_node_collection");
const ReadyFunctions = [];


window.$1 = (argument) => {
  if (typeof argument === "string") {
    const nodeList = document.querySelectorAll(argument);
    const elementArray = Array.from(nodeList);
    return new DOMNodeCollection(elementArray);
  } else if (argument instanceof HTMLElement) {
    const HTMLArray = [argument];
    return new DOMNodeCollection(HTMLArray);
  } else if (typeof argument === "function") {
    ReadyFunctions.push(argument);
  }
}

const check = () => {
  console.log(document.readyState);
}
check()

$1(check)


ReadyFunctions.forEach(func => {
  document.addEventListener("DOMContentLoaded", func);
});