const Inbox = {
  render () {
    const ulContainer = document.createElement("ul");
    ulContainer.className = "messages";
    ulContainer.innerHTML = "An Inbox Message";
    return ulContainer;
  }
}

module.exports = Inbox;