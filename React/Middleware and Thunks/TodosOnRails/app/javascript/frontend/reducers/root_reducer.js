import { combineReducers } from "redux";
import todosReducer from "./todos_reducer";
import stepsReducer from "./steps_reducer";
import errorReducer from "./error_reducer";
import prefsReducer from "./prefs_reducer";

const rootReducer = combineReducers({
  todos: todosReducer,
  steps: stepsReducer,
  errors: errorReducer,
  prefs: prefsReducer
});

export default rootReducer;
