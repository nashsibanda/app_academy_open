import { createStore, applyMiddleware } from "redux";
import rootReducer from "../reducers/root_reducer";

const configureStore = (preloadedState = {}) => {
  const store = createStore(
    rootReducer,
    preloadedState,
    applyMiddleware(justSayBanana, addLoggingToDispatch)
  );
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

const addLoggingToDispatch = store => next => action => {
  console.log(store.getState());
  console.log(action);
  next(action);
  console.log(store.getState());
};

const justSayBanana = store => next => action => {
  console.log("BANANA Type: " + action.type);
  next(action);
};

export default configureStore;
