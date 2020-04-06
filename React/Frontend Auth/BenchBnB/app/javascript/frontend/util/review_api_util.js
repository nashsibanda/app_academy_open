export const getReviews = (reviewType, typeId) =>
  $.ajax({
    type: "get",
    url: `api/${reviewType}/${typeId}/reviews`,
  });

export const getReview = id =>
  $.ajax({
    type: "get",
    url: `api/reviews/${id}`,
  });

export const postReview = review =>
  $.ajax({
    type: "post",
    url: "api/reviews",
    data: review,
    success: resp => console.log(resp),
    error: err => console.log(err.responseText),
  });
