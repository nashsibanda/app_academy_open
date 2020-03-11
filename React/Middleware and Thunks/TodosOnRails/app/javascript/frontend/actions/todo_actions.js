export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";
import TodoApi from "./../util/todo_api_util";
import { receiveErrors, clearErrors } from "./error_actions";
import { fetchingOn, fetchingOff } from "./fetching_actions";

export const receiveTodos = todos_array => {
  return {
    type: RECEIVE_TODOS,
    todos: todos_array
  };
};

export const receiveTodo = todo => {
  return {
    type: RECEIVE_TODO,
    todo: todo
  };
};

export const removeTodo = todo => {
  return {
    type: REMOVE_TODO,
    todo: todo
  };
};

export const fetchTodos = () => dispatch => {
  dispatch(fetchingOn());
  TodoApi.fetchTodos().then(todos => {
    dispatch(fetchingOff());
    dispatch(receiveTodos(todos));
  });
};

export const createTodo = todo => dispatch => {
  dispatch(fetchingOn());
  TodoApi.createTodo(todo).then(
    todo => {
      dispatch(fetchingOff());
      dispatch(receiveTodo(todo));
      dispatch(clearErrors());
    },
    err => {
      dispatch(fetchingOff());
      dispatch(receiveErrors(err.responseJSON));
    }
  );
};

export const updateTodo = todo => dispatch => {
  dispatch(fetchingOn());
  TodoApi.updateTodo(todo).then(
    todo => {
      dispatch(fetchingOff());
      dispatch(receiveTodo(todo));
      dispatch(clearErrors());
    },
    err => {
      dispatch(fetchingOff());
      dispatch(receiveErrors(err.responseJSON));
    }
  );
};

export const deleteTodo = todo => dispatch => {
  dispatch(fetchingOn());
  TodoApi.deleteTodo(todo).then(
    todo => {
      dispatch(fetchingOff());
      dispatch(removeTodo(todo));
      dispatch(clearErrors());
    },
    err => {
      dispatch(fetchingOff());
      dispatch(receiveErrors(err.responseJSON));
    }
  );
};
