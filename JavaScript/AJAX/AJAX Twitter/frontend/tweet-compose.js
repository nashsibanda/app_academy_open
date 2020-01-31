const APIUtil = require("./api_util");

class TweetCompose {
  constructor(el) {
    this.$el = $(el);
    this.$el.on("submit", this.submitHandler.bind(this));
    this.$el.on("input", "textarea", this.charsLeft.bind(this));
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
      console.log(response);
    });
  }

  clearInput() {
    this.$el.find(":input").text("");
    this.$el.find(":input").val("");
  }

  handleSuccess(response) {
    this.clearInput();
    this.$el.find(":input").prop("disabled", false);
    this.$el.find(".form-button").val("Post Tweet!");
    let $newTweet = $("<li>");
    let tweetContent = JSON.stringify(response);
    $newTweet.append(tweetContent);
    this.$tweetsUl.prepend($newTweet);
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
    console.log($charsLeft);
  }
}

module.exports = TweetCompose;