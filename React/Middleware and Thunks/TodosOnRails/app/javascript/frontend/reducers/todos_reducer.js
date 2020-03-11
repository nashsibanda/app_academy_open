import {
  RECEIVE_TODO,
  RECEIVE_TODOS,
  REMOVE_TODO
} from "../actions/todo_actions";

const initialState = {};

const todosReducer = (state = initialState, action) => {
  switch (action.type) {
    case RECEIVE_TODOS:
      const receivedTodos = {};
      action.todos.forEach(todo => {
        receivedTodos[todo.id] = todo;
      });
      return receivedTodos;
    case RECEIVE_TODO:
      const receivedTodo = { [action.todo.id]: action.todo };
      return Object.assign({}, state, receivedTodo);
    case REMOVE_TODO:
      const shortenedTodos = Object.assign({}, state);
      delete shortenedTodos[action.todo.id];
      return shortenedTodos;
    default:
      return state;
  }
};

export default todosReducer;
