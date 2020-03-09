import { createStore, applyMiddleware, compose } from "redux";
import rootReducer from "../reducers/root_reducer";
import thunk from "./../middleware/thunk";

const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;

const configureStore = createStore(
  rootReducer,
  composeEnhancers(applyMiddleware(thunk))
);

export default configureStore;
