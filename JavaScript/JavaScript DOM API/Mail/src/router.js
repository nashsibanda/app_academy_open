class Router {
  constructor(node, routes) {
    this.node = node;
    this.routes = routes;
  }

  start () {
    this.render();
    window.addEventListener("hashchange", this.render.bind(this));
  }

  render () {
    console.log("change!");
    // this.node.innerHTML = "";
    const component = this.activeRoute();
    if (!component) {
      this.node.innerHTML = "";
    } else {
      this.node.innerHTML = "";
      const newNode = component.render()
      this.node.appendChild(newNode);
    }
    // const newPNode = document.createElement("p");
    // newPNode.innerHTML = newRouteName;
  }

  activeRoute () {
    const routeHashFragment = window.location.hash.slice(1);
    return this.routes[routeHashFragment];
  }
 }

module.exports = Router;