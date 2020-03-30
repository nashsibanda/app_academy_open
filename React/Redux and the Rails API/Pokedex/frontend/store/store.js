import { createStore, applyMiddleware } from "redux";
import { composeWithDevTools } from "redux-devtools-extension";
import rootReducer from "../reducers/root_reducer.js";
import logger from "redux-logger";
import thunk from "../middleware/thunk";

const configureStore = () =>
  createStore(rootReducer, composeWithDevTools(applyMiddleware(thunk, logger)));

export default configureStore;
