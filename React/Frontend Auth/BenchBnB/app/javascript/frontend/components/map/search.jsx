import React from "react";
import BenchMap from "./bench_map";
import BenchIndex from "./../benches/bench_index";

export default function Search(props) {
  const { benches, fetchBenches, updateBounds } = props;
  return (
    <div className="bench-search">
      <BenchMap benches={benches} updateBounds={updateBounds} />
      <BenchIndex benches={benches} fetchBenches={fetchBenches} />
    </div>
  );
}
