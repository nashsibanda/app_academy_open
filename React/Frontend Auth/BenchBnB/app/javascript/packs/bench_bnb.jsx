import React from "react";
import ReactDOM from "react-dom";
import configureStore from "../frontend/store/store";
import Root from "../frontend/components/root";
// import { getBenches } from "../frontend/util/bench_api_util";
import { fetchBenches } from "../frontend/actions/bench_actions";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  let store;
  if (window.currentUser) {
    const preloadedState = {
      entities: {
        users: { [window.currentUser.id]: window.currentUser },
      },
      session: { id: window.currentUser.id },
    };
    store = configureStore(preloadedState);
    delete window.currentUser;
  } else {
    store = configureStore();
  }
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.fetchBenches = fetchBenches;
  ReactDOM.render(<Root store={store} />, root);
});
