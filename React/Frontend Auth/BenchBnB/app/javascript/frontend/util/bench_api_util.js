export const getBenches = data => {
  console.log(data);
  return $.ajax({
    type: "get",
    url: "api/benches",
    data,
    error: err => console.log(err.responseText),
  });
};
