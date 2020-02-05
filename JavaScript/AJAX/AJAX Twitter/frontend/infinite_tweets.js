const APIUtil = require("./api_util");

class InfiniteTweets {
  constructor() {
    this.$el = $(".infinite-tweets");
    this.$list = $(this.$el.find("#feed-ul"));
    this.$el.on("click", ".fetch-more-btn", this.fetchTweets.bind(this));
    this.maxCreatedAt = null;
    this.fetchTweets();
    this.$el.on("insert-tweet", this.insertTweet.bind(this));
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

  insertTweet(event, tweet) {
    this.$list.prepend(this.tweetTemplate(tweet));
    if (!this.maxCreatedAt) {
      this.maxCreatedAt = tweet.created_at;
    }
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
      let $newTweet = this.tweetTemplate(tweet);
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

  tweetTemplate(tweet) {
    const mentions = tweet.mentions.map(mention => `
      <li>
        <a href="/users/${mention.user.id}">${mention.user.username}</a>
      </li>
    `).join("");
    const tweetString = `
      <li class="tweet">
        <div class="tweet-content">${tweet.content}</div>
        <div class="tweet-info">
          posted by <a href="/users/${tweet.user.id}">@${tweet.user.username}</a>
          on ${this.niceDate(tweet.created_at)}
        </div>

        ${(tweet.mentions.length > 0 ? `<small class="tweet-info">Mentions:</small>`: "")}
        <ul class="tweet-mentioned-users">
          ${mentions}
        </ul>
      </li>
    `
    return $(tweetString);
  }

  niceDate(dateString) {
    const date = new Date(dateString);
    const options = {
      year: 'numeric',
      month: "long",
      day: "numeric",
      hour: "numeric",
      minute: "numeric"
    }
    return date.toLocaleDateString("en-US", options);
  }
}

module.exports = InfiniteTweets;