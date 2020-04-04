import { fetchBenches } from "./bench_actions";

export const RECEIVE_BOUNDS = "RECEIVE_BOUNDS";

const receiveBounds = bounds => ({
  type: RECEIVE_BOUNDS,
  bounds,
});

export const updateBounds = bounds => (dispatch, getState) => {
  dispatch(receiveBounds(bounds));
  return fetchBenches(getState().ui.filters)(dispatch);
};
