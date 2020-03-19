const APIUtil = {
  fetchAllPokemon: () =>
    $.ajax({
      type: "get",
      url: "api/pokemon",
      dataType: "json",
      success: function(response) {
        console.log("Successfully fetched Pokemon with fetchAllPokemon!");
      }
    })
};

export default APIUtil;
