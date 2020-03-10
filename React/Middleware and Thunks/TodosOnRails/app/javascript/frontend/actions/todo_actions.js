export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";
import TodoApi from "./../util/todo_api_util";
import { receiveErrors, clearErrors } from "./error_actions";

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

export const fetchTodos = () => dispatch =>
  TodoApi.fetchTodos().then(todos => dispatch(receiveTodos(todos)));

export const createTodo = todo => dispatch =>
  TodoApi.createTodo(todo).then(
    todo => {
      dispatch(receiveTodo(todo));
      dispatch(clearErrors());
    },
    err => dispatch(receiveErrors(err.responseJSON))
  );

export const updateTodo = todo => dispatch =>
  TodoApi.updateTodo(todo).then(
    todo => {
      dispatch(receiveTodo(todo));
      dispatch(clearErrors());
    },
    err => dispatch(receiveErrors(err.responseJSON))
  );
