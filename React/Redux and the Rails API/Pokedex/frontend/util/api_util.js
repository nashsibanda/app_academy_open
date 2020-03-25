const APIUtil = {
  fetchAllPokemon: () =>
    $.ajax({
      type: "get",
      url: "api/pokemon",
      dataType: "json",
      success: function(response) {
        console.log("Successfully fetched Pokemon with fetchAllPokemon!");
      }
    }),
  fetchOnePokemon: id =>
    $.ajax({
      type: "get",
      url: `api/pokemon/${id}`,
      dataType: "json",
      success: function(response) {
        console.log(
          // "Successfully fetched single Pokemon with fetchOnePokemon!"
          response
        );
      }
    })
};

export default APIUtil;
