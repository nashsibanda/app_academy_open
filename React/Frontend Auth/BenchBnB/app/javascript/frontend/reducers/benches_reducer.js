import { RECEIVE_BENCHES } from "../actions/bench_actions";

const benchesReducer = (state = {}, action) => {
  Object.freeze(state);
  const benchesOutput = {};
  switch (action.type) {
    case RECEIVE_BENCHES:
      action.benches.forEach(bench => {
        benchesOutput[bench.id] = bench;
      });
      return benchesOutput;
    default:
      return state;
  }
};

export default benchesReducer;
