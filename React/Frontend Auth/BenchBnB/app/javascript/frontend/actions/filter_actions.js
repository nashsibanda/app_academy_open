import { fetchBenches } from "./bench_actions";

export const RECEIVE_BOUNDS = "RECEIVE_BOUNDS";
export const UPDATE_FILTER = "UPDATE_FILTER";

const receiveBounds = bounds => ({
  type: RECEIVE_BOUNDS,
  bounds,
});

export const changeFilter = (filter, value) => ({
  type: UPDATE_FILTER,
  filter,
  value,
});

export const updateBounds = bounds => (dispatch, getState) => {
  dispatch(receiveBounds(bounds));
  return fetchBenches(getState().ui.filters)(dispatch);
};

export const updateFilter = (filter, value) => (dispatch, getState) => {
  dispatch(changeFilter(filter, value));
  return fetchBenches(getState().ui.filters)(dispatch);
};
