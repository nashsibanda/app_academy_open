function setHashFragment (event) {
  target = event.currentTarget;
  locVar = target.innerText.toLowerCase();
  window.location.hash = locVar;
}

function addSidebarLiListeners () {
  liElements = document.querySelectorAll(".sidebar-nav li");
  liElements.forEach(element => {
    element.addEventListener("click", setHashFragment);
  })
}

document.addEventListener("DOMContentLoaded", addSidebarLiListeners);