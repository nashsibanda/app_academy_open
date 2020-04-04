export const getBenches = filters =>
  $.ajax({
    type: "get",
    url: "api/benches",
    filters,
    error: err => console.log(err.responseText),
  });
