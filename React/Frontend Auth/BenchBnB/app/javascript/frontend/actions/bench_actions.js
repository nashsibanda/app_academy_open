export const RECEIVE_BENCHES = "RECEIVE_BENCHES";
import * as BenchesAPIUtil from "./../util/bench_api_util";

const receiveBenches = benches => ({
  type: RECEIVE_BENCHES,
  benches,
});

export const fetchBenches = filters => dispatch => {
  BenchesAPIUtil.getBenches(filters).then(benches =>
    dispatch(receiveBenches(benches))
  );
};
