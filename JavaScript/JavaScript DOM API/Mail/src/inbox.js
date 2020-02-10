const MessageStore = require("./message_store");

const Inbox = {
  render () {
    const container = document.createElement("ul");
    container.className = "messages";
    const messages = MessageStore.getInboxMessages();
    messages.forEach(message => {
      const messageNode = this.renderMessage(message);
      container.appendChild(messageNode);
    })
    return container;
  },
  renderMessage(message) {
    const liNode = document.createElement("li");
    liNode.className = "message";
    liNode.innerHTML = `
      <span class="from">${message.from}</span>
      <span class="subject">${message.subject}</span>
      <span class="body">${message.body}</span>
    `
    return liNode;
  }
}

module.exports = Inbox;