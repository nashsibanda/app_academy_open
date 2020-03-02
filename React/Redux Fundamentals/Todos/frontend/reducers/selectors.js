const allTodos = state => {
  const todoKeys = Object.keys(state.todos);
  const todosArray = todoKeys.map(key => state.todos[key]);
  return todosArray;
};

export default allTodos;
