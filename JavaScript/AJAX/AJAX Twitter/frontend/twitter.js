const FollowToggle = require("./follow_toggle");
const UsersSearch = require("./users_search");
const TweetCompose = require("./tweet-compose")

$(() => {
  $(".follow-toggle").each(function() {
    new FollowToggle(this);
    console.log("Follow toggle called");
  })

  $(".users-search").each(function() {
    new UsersSearch(this);
    console.log("User search called");
  })

  $(".tweet-compose").each(function() {
    new TweetCompose(this);
    console.log("Tweet compose called")
  })
});