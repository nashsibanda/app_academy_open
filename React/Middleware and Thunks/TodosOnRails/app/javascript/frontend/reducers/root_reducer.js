import { combineReducers } from "redux";
import todosReducer from "./todos_reducer";
import stepsReducer from "./steps_reducer";
import errorReducer from "./error_reducer";
import prefsReducer from "./prefs_reducer";
import fetchingReducer from "./fetching_reducer";

const rootReducer = combineReducers({
  todos: todosReducer,
  steps: stepsReducer,
  errors: errorReducer,
  prefs: prefsReducer,
  fetching: fetchingReducer
});

export default rootReducer;
