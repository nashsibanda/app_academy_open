const Router = require("./router");
const Inbox = require("./inbox");

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
  window.router = new Router(contentNode, routes);
  addSidebarLiListeners();
  window.router.start();
}

document.addEventListener("DOMContentLoaded", onLoadCallback);

const routes = {
  // "compose": ,
  // "sent": ,
  "inbox": Inbox
}