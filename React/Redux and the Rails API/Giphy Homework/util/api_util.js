const APIUtil = {
  fetchSearchGiphys: searchTerm =>
    $.ajax({
      type: "get",
      url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=PZSLvoqas2ydhRhKf1LKNjGE7BMUPaM2&limit=2`,
      // dataType: "json",
      success: function(response) {
        console.log("Successfully made request with fetchSearchGiphys");
      }
    })
};

export default APIUtil;
