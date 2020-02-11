const MessageStore = require("./message_store");

const Compose = {
  render() {
    const container = document.createElement("div");
    container.className = "new-message";
    container.innerHTML = this.renderForm();
    container.addEventListener("change", this.updateDraft);
    container.addEventListener("submit", this.sendMessage)
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
  },
  updateDraft() {
    event.preventDefault();
    MessageStore.updateDraftField(event.target.name, event.target.value);
  },
  sendMessage() {
    event.preventDefault();
    MessageStore.sendDraft();
    window.location.hash = "#inbox"
  }
};

module.exports = Compose;
