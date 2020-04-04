export const getBenches = () =>
  $.ajax({
    type: "get",
    url: "api/benches",
    error: err => console.log(err.responseText),
  });
