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

window.$1.extend = (...objects) => {
  const outputObject = {};
  objects.forEach(object => {
    const objectKeys = Object.keys(object);
    objectKeys.forEach(key => {
      outputObject[key] = object[key];
    })
  })
  return outputObject;
}

window.$1.ajax = (customOptions) => {
  const defaults = {
    url: window.location.href,
    method: "GET",
    data: "",
    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
    success(data) {
      console.log("Success!");
      console.log(data);
    },
    error() {
      console.log("An error occurred!");
    }
  }

  const options = window.$1.extend(defaults, customOptions);

  const request = new XMLHttpRequest;
  request.open(options.method, options.url);
  request.onload = function () {
    options.success(JSON.parse(request.response));
  };
  request.send(options.data);
}

const check = () => {
  console.log(document.readyState);
}
check()

$1(check)


ReadyFunctions.forEach(func => {
  document.addEventListener("DOMContentLoaded", func);
});