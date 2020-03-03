import { createStore } from "redux";
// import { receiveTodo, receiveTodos } from "./../actions/todo_actions";
import rootReducer from "./../reducers/root_reducer";

const configureStore = createStore(
  rootReducer,
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__()
);

export default configureStore;
