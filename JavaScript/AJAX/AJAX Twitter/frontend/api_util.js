const APIUtil = {
  followUser: id => (
    $.ajax({
      type: "POST",
      url: `/users/${id}/follow`,
      dataType: "json",
      success(response) {
        // console.log("Now followed!")
      }
    })
  ),
  unfollowUser: id => (
    $.ajax({
      type: "DELETE",
      url: `/users/${id}/follow`,
      dataType: "json",
      success(response) {
        // console.log("Now unfollowed!")
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
        // console.log("Searched!")
      }
    })
  ),
  createTweet: data => (
    $.ajax({
      type: "POST",
      url: "/tweets",
      dataType: "json",
      data: data,
      success(response) {
        // console.log("Tweet posted!")
      }
    })
  ),
  fetchTweets: max_created_at => (
    $.ajax({
      type: "GET",
      url: "/feed",
      dataType: "json",
      data: { max_created_at },
      success(response) {
        // console.log("Tweets fetched!")
      }
    })
  )
}

module.exports = APIUtil;