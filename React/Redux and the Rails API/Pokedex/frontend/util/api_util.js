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
          "Successfully fetched single Pokemon with fetchOnePokemon!"
        );
      }
    }),
  postNewPokemon: pokemon =>
    $.ajax({
      type: "post",
      url: "api/pokemon",
      dataType: "json",
      data: pokemon,
      success: function(response) {
        console.log("Successfully added a Pokemon with postNewPokemon!");
      }
    })
};

export default APIUtil;
