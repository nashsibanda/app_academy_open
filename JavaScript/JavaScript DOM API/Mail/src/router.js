class Router {
  constructor(node) {
    this.node = node;
  }

  start () {
    this.render();
    window.addEventListener("hashchange", this.render.bind(this));
  }

  render () {
    console.log("change!");
    this.node.innerHTML = "";
    const newRouteName = this.activeRoute();
    const newPNode = document.createElement("p");
    newPNode.innerHTML = newRouteName;
    this.node.appendChild(newPNode);
  }

  activeRoute () {
    const routeHashFragment = window.location.hash.slice(1);
    return routeHashFragment;
  }
 }

module.exports = Router;