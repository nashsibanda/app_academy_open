const APIUtil = require("./api_util");
const FollowToggle = require("./follow_toggle");

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.$input = this.$el.find("input");
    this.$ul = this.$el.find(".users");
    this.$el.on("input", this.handleInput.bind(this));
  }

  handleInput() {
    const usersSearch = this;
    APIUtil.searchUsers(this.$input.val()).then( (response) => {
      usersSearch.renderResults(response)
    })
  }

  renderResults(response) {
    this.$ul.empty();
    const $usersSearchUl = this.$ul;
    response.forEach(function(element) {
      let $userListElement = $("<li>");
      let $userLink = $("<a>");
      let $userFollowButton = $("<button>");
      $userFollowButton.addClass("follow-toggle");
      let followToggleOptions = {
        followState: (element.followed ? "followed" : "unfollowed"),
        userId: element.id
      };
      new FollowToggle($userFollowButton, followToggleOptions);
      $userLink.attr("href", `/users/${element.id}`);
      $userLink.text(element.username);
      $userListElement.append($userLink, $userFollowButton);
      $usersSearchUl.append($userListElement);
    })
  }

}

module.exports = UsersSearch;