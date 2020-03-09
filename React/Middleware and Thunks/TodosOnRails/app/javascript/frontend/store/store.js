import { createStore } from "redux";
import rootReducer from "../reducers/root_reducer";

const myStorage = window.localStorage;

const initialState = () => {
  if (myStorage.getItem("localState")) {
    return JSON.parse(myStorage.getItem("localState"));
  } else {
    return undefined;
  }
};

const configureStore = createStore(
  rootReducer,
  initialState(),
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__()
);

configureStore.subscribe(() => {
  myStorage.setItem("localState", JSON.stringify(configureStore.getState()));
});

export default configureStore;
