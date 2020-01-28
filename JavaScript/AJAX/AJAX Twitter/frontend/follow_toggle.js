class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    this.render();
    this.handleClick();
  }

  render() {
    if (this.followState === "unfollowed") {
      this.$el.text("Follow!");
    } else if (this.followState === "followed") {
      this.$el.text("Unfollow!");
    }
  }

  handleClick() {
    const that = this;
    this.$el.on("click", function () {
      event.preventDefault();
      console.log(this);
      let reqType = "GET";
      if (that.followState === "followed") {
        reqType = "DELETE";
      } else if (that.followState === "unfollowed") {
        reqType = "POST";
      }
      $.ajax({
        type: reqType,
        url: `/users/${that.userId}/follow`,
        dataType: "json",
        success(response) {
          that.toggleFollowState();
          that.render();
        }
      })
    });
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