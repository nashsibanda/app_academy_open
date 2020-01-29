const APIUtil = require("./api_util");

class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    this.render();
    this.$el.on("click", this.handleClick.bind(this));
  }

  render() {
    switch (this.followState) {
      case "unfollowed":
        this.$el.text("Follow!");
        this.$el.prop("disabled", false);
        break;
      case "followed":
        this.$el.text("Unfollow!");
        this.$el.prop("disabled", false);
        break;
      case "following":
        this.$el.text("Following...");
        this.$el.prop("disabled", true);
        break;
      case "unfollowing":
        this.$el.text("Unfollowing...");
        this.$el.prop("disabled", true);
        break;
    }
  }

  handleClick() {
    const followToggle = this;
    event.preventDefault();
    if (followToggle.followState === "followed") {
      followToggle.followState = "unfollowing";
      followToggle.render();
      APIUtil.unfollowUser(followToggle.userId).then( () => {
        followToggle.followState = "unfollowed";
        followToggle.render();
      })
    } else if (followToggle.followState === "unfollowed") {
      followToggle.followState = "following";
      followToggle.render();
      APIUtil.followUser(followToggle.userId).then( () => {
        followToggle.followState = "followed";
        followToggle.render();
      })
    };
  }

  toggleFollowState() {
    if (this.followState === "followed") {
      this.followState = "unfollowed";
    } else {
      this.followState = "followed";
    };
  }
}

module.exports = FollowToggle;