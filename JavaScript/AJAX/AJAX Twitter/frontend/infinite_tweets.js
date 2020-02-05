const APIUtil = require("./api_util");

class InfiniteTweets {
  constructor() {
    this.$el = $(".infinite-tweets");
    this.$list = $(this.$el.find("#feed-ul"));
    this.$el.on("click", ".fetch-more-btn", this.fetchTweets.bind(this));
    this.maxCreatedAt = null;
    this.fetchTweets();
  }

  fetchTweets() {
    const infiniteTweets = this;
    if (this.maxCreatedAt !== null) {
      APIUtil.fetchTweets(this.maxCreatedAt).then( (response) => {
        infiniteTweets.insertTweets(response);
      })
    } else {
        APIUtil.fetchTweets().then( (response) => {
          infiniteTweets.insertTweets(response);
        })
    }
    return false;
  }
  
  insertTweets(response) {
    const $tweetsList = this.$list;
    if (response.length < 20) {
      this.noMoreTweets();
      if (response.length === 0) {
        return false;
      }
    }
    response.forEach( (tweet) => {
      let $newTweet = $("<li>", {
        "class": "tweet",
        "data-created-at": tweet.created_at
      });
      $newTweet.append(`ID: ${JSON.stringify(tweet.id)}, Created at: ${JSON.stringify(tweet.created_at)}<br><br>Content: ${tweet.content}`);
      if (this.$list.children().length !== 0 && tweet.created_at > this.$list.find("li:first-child").data("created-at")) {
        $tweetsList.prepend($newTweet);
      } else {
        $tweetsList.append($newTweet);
      }
    })
    this.maxCreatedAt = response[response.length - 1].created_at;
  }

  noMoreTweets() {
    let $fetchButton = this.$el.find(".fetch-more-btn");
    $fetchButton.text("No more tweets");
    $fetchButton.removeAttr("href");
    $fetchButton.addClass("disabled-button");
    $fetchButton.removeClass("fetch-more-btn");
  }
}

module.exports = InfiniteTweets;