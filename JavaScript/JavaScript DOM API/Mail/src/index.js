const Router = require("./router");
const Inbox = require("./inbox");
const Sent = require("./sent");
const Compose = require("./compose");

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
  window.location.hash = "#inbox";
}

document.addEventListener("DOMContentLoaded", onLoadCallback);

const routes = {
  "compose": Compose,
  "sent": Sent,
  "inbox": Inbox
}