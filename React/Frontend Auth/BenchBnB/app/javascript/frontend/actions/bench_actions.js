export const RECEIVE_BENCHES = "RECEIVE_BENCHES";
export const RECEIVE_BENCH = "RECEIVE_BENCH";
import * as BenchesAPIUtil from "./../util/bench_api_util";

const receiveBenches = benches => ({
  type: RECEIVE_BENCHES,
  benches,
});

const receiveBench = bench => ({
  type: RECEIVE_BENCH,
  bench,
});

export const fetchBenches = filters => dispatch => {
  BenchesAPIUtil.getBenches(filters).then(benches =>
    dispatch(receiveBenches(benches))
  );
};

export const createBench = bench => dispatch => {
  BenchesAPIUtil.postBench(bench).then(bench => dispatch(receiveBench(bench)));
};

export const fetchBench = benchId => dispatch => {
  BenchesAPIUtil.getBench(benchId).then(bench => {
    console.log("FROM API");
    console.log(bench);
    dispatch(receiveBench(bench));
  });
};
