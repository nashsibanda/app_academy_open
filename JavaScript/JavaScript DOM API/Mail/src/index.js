const Router = require("./router");

function setHashFragment (event) {
  const target = event.currentTarget;
  const locVar = target.innerText.toLowerCase();
  window.location.hash = locVar;
}

function addSidebarLiListeners () {
  const liElements = document.querySelectorAll(".sidebar-nav li");
  liElements.forEach(element => {
    element.addEventListener("click", setHashFragment);
  })
}

function onLoadCallback () {
  contentNode = document.querySelector(".content")
  window.router = new Router(contentNode);
  addSidebarLiListeners();
  window.router.start();
}

document.addEventListener("DOMContentLoaded", onLoadCallback);

// function checkerchanger() {
//   console.log("chechech")
// }

// window.addEventListener("hashchange", checkerchanger);