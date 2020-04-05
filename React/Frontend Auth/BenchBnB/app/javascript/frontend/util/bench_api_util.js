export const getBenches = data =>
  $.ajax({
    type: "get",
    url: "api/benches",
    data,
    error: err => console.log(err.responseText),
  });

export const getBench = benchId =>
  $.ajax({
    type: "get",
    url: `api/benches/${benchId}`,
  });

export const postBench = bench =>
  $.ajax({
    type: "post",
    url: "api/benches",
    data: bench,
    error: err => console.log(err.responseText),
  });
