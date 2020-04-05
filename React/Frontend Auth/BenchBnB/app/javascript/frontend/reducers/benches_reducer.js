import { RECEIVE_BENCHES, RECEIVE_BENCH } from "../actions/bench_actions";

const benchesReducer = (state = {}, action) => {
  Object.freeze(state);
  const benchesOutput = {};
  switch (action.type) {
    case RECEIVE_BENCHES:
      action.benches.forEach(bench => {
        benchesOutput[bench.id] = bench;
      });
      return benchesOutput;
    case RECEIVE_BENCH:
      const { bench } = action;
      return Object.assign({}, state, { [bench.id]: bench });
    default:
      return state;
  }
};

export default benchesReducer;
