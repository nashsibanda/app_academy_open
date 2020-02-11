const MessageStore = require("./message_store");

const Compose = {
  render() {
    const container = document.createElement("ul");
    container.className = "new-message";
    container.innerHTML = this.renderForm();
    return container;
  },
  renderForm() {
    let currentDraft = MessageStore.getMessageDraft();
    const composeFormHtml = `
      <p class="new-message-header">New Message</p>
      <form class="compose-form">
        <input type="text" name="to" placeholder="Recipient" value="${currentDraft.to}">
        <input type="text" name="subject" placeholder="Subject" value="${currentDraft.subject}">
        <textarea name="body" rows="10">${currentDraft.body}</textarea>
        <button type="submit" class="btn btn-primary submit-message">Send</button>
      </form>
    `;
    return composeFormHtml;
  }
};

module.exports = Compose;
