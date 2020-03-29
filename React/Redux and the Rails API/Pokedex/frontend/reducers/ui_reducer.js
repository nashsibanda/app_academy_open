import { combineReducers } from "redux";
import errorsReducer from "./errors_reducer";

const uiReducer = combineReducers({
  errors: errorsReducer,
  loading: {}
});

export default uiReducer;
