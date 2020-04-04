import React from "react";
import BenchMap from "./bench_map";
import BenchIndex from "./../benches/bench_index";

export default function Search(props) {
  const { benches, fetchBenches } = props;
  return (
    <div className="bench-search">
      <BenchMap benches={benches} />
      <BenchIndex benches={benches} fetchBenches={fetchBenches} />
    </div>
  );
}
