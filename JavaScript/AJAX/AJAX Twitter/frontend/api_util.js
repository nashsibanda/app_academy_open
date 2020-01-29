const APIUtil = {
  followUser: id => (
    $.ajax({
      type: "POST",
      url: `/users/${id}/follow`,
      dataType: "json",
      success(response) {
        // that.toggleFollowState();
        // that.render();
        console.log("Now followed!")
      }
    })
  ),
  unfollowUser: id => (
    $.ajax({
      type: "DELETE",
      url: `/users/${id}/follow`,
      dataType: "json",
      success(response) {
        // that.toggleFollowState();
        // that.render();
        console.log("Now unfollowed!")
      }
    })
  )
}

module.exports = APIUtil;