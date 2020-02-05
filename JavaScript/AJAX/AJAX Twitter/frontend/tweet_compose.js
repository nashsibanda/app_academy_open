const APIUtil = require("./api_util");

class TweetCompose {
  constructor(el) {
    this.$el = $(el);
    this.$el.on("submit", this.submitHandler.bind(this));
    this.$el.on("input", "textarea", this.charsLeft.bind(this));
    this.$el.on("click", ".new-mention-select-btn", this.newUserSelect.bind(this));
    this.$el.on("click", "a.remove-mentioned-user", this.removeMentionedUser.bind(this));
    this.$tweetsUl = $(this.$el.data("tweets-ul"));
  }

  submitHandler() {
    event.preventDefault();
    const tweetCompose = this;
    let formData = tweetCompose.$el.serializeJSON();
    tweetCompose.$el.find(":input").prop("disabled", true);
    tweetCompose.$el.find(".form-button").val("Posting...");
    APIUtil.createTweet(formData).then( (response) => {
      tweetCompose.handleSuccess(response);
    });
  }

  clearInput() {
    this.$el.find("textarea").val("");
    this.$el.find(".mentions-select-list").empty();
  }

  handleSuccess(response) {
    this.clearInput();
    this.$el.find(":input").prop("disabled", false);
    this.$el.find(".form-button").val("Post Tweet!");
    let $successMessage = $("<div>");
    $successMessage.text("Tweet successfully posted!");
    $successMessage.addClass("tweet-post-success-message");
    this.$el.append($successMessage);
    let $newTweet = $("<li>");
    let tweetContent = JSON.stringify(response);
    $newTweet.append(tweetContent);
    this.$tweetsUl.prepend($newTweet);
    setTimeout(() => {
      $(".tweet-post-success-message").remove();
    }, 3000);
  }

  charsLeft() {
    let $charsLeft = $(event.currentTarget).find(".chars-left");
    let currentLength = $(event.currentTarget).find("textarea").val().length;
    let currentValue = 140 - currentLength;
    $charsLeft.text(currentValue);
    if (currentValue < 20) {
      $charsLeft.addClass("low-remaining-characters")
    } else if (currentValue >= 20) {
      $charsLeft.removeClass("low-remaining-characters");
    }
  }

  newUserSelect() {
    const $mentionsList = this.$el.find(".mentions-select-list");
    let $newListItem = $("<li>");
    let $newSelect = $("<select>", {
      "class": "user-mention-select",
      "name": "tweet[mentioned_user_ids][]"
    });
    let $defaultOption = $("<option>", {
      "disabled": true,
      "selected": true,
      text: "Select a user to mention..."
    });
    $newSelect.append($defaultOption);
    for (let i = 0; i < window.users.length; i++) {
      const user = window.users[i];
      let $userOption = $("<option>", {
        "value": user.id,
        text: user.username
      });
      $newSelect.append($userOption);
    }
    let $selectRemover = $("<a>", {
      "href": "#",
      "class": "remove-mentioned-user form-button",
      text: "x"
    })
    $newListItem.append($newSelect, $selectRemover);
    $mentionsList.append($newListItem);
  }

  removeMentionedUser() {
    const $clickedRemover = $(event.target);
    $clickedRemover.parent().remove();
    return false;
  }
}

module.exports = TweetCompose;