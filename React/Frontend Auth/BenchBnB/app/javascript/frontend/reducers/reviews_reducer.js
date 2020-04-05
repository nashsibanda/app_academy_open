import {
  RECEIVE_REVIEWS,
  RECEIVE_REVIEW,
  CLEAR_REVIEWS,
} from "../actions/review_actions";

const reviewsReducer = (state = {}, action) => {
  Object.freeze(state);
  const reviewsOutput = {};
  switch (action.type) {
    case RECEIVE_REVIEWS:
      action.reviews.forEach(review => {
        reviewsOutput[review.id] = review;
      });
      return reviewsOutput;
    case RECEIVE_REVIEW:
      const { review } = action;
      return Object.assign({}, state, { [review.id]: review });
    case CLEAR_REVIEWS:
      return {};
    default:
      return state;
  }
};

export default reviewsReducer;
