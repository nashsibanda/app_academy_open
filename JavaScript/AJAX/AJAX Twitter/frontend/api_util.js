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
  ),
  searchUsers: query => (
    $.ajax({
      type: "GET",
      url: "/users/search",
      dataType: "json",
      data: {query},
      success(response) {
        console.log("Searched!")
      }
    })
  )
}

module.exports = APIUtil;