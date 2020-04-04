export const RECEIVE_BENCHES = "RECEIVE_BENCHES";
import * as BenchesAPIUtil from "./../util/bench_api_util";

const receiveBenches = benches => ({
  type: RECEIVE_BENCHES,
  benches,
});

export const fetchBenches = () => dispatch => {
  BenchesAPIUtil.getBenches().then(benches =>
    dispatch(receiveBenches(benches))
  );
};
