export const RECEIVE_REVIEWS = "RECEIVE_REVIEWS";
export const RECEIVE_REVIEW = "RECEIVE_REVIEW";
export const CLEAR_REVIEWS = "CLEAR_REVIEWS";
import * as ReviewAPI from "./../util/review_api_util";

const receiveReviews = reviews => ({
  type: RECEIVE_REVIEWS,
  reviews,
});

const receiveReview = review => ({
  type: RECEIVE_REVIEW,
  review,
});

export const clearReviews = () => ({
  type: CLEAR_REVIEWS,
});

export const fetchReviews = (reviewType, typeId) => dispatch => {
  ReviewAPI.getReviews(reviewType, typeId).then(reviews =>
    dispatch(receiveReviews(reviews))
  );
};

export const fetchReview = id => dispatch => {
  ReviewAPI.getReview(id).then(review => dispatch(receiveReview(review)));
};

export const createReview = formReview => dispatch => {
  ReviewAPI.postReview(formReview).then(review =>
    dispatch(receiveReview(review))
  );
};
