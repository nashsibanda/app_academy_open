import React from "react";
import BenchMap from "./bench_map";
import BenchIndex from "./../benches/bench_index";
import FilterForm from "./filter_form";

export default function Search(props) {
  const { benches, fetchBenches, updateFilter, minSeating, maxSeating } = props;
  return (
    <div className="bench-search">
      <FilterForm
        minSeating={minSeating}
        maxSeating={maxSeating}
        updateFilter={updateFilter}
      />
      <BenchMap benches={benches} updateFilter={updateFilter} />
      <BenchIndex benches={benches} fetchBenches={fetchBenches} />
    </div>
  );
}
