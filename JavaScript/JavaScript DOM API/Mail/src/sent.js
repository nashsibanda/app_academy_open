const MessageStore = require("./message_store");

const Sent = {
  render() {
    const container = document.createElement("ul");
    container.className = "messages";
    const messages = MessageStore.getSentMessages();
    messages.forEach(message => {
      const messageNode = this.renderMessage(message);
      container.appendChild(messageNode);
    });
    return container;
  },
  renderMessage(message) {
    const liNode = document.createElement("li");
    liNode.className = "message";
    liNode.innerHTML = `
      <span class="to">${message.to}</span>
      <span class="subject">${message.subject}</span>
      <span class="body">${message.body}</span>
    `;
    return liNode;
  }
};

module.exports = Sent;
