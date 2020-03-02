export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

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
