export const getBenches = data => {
  console.log(data);
  return $.ajax({
    type: "get",
    url: "api/benches",
    data,
    error: err => console.log(err.responseText),
  });
};

export const postBench = bench =>
  $.ajax({
    type: "post",
    url: "api/benches",
    data: bench,
    error: err => console.log(err.responseText),
  });
