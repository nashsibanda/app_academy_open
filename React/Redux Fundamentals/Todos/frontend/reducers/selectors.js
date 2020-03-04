export const allTodos = state => {
  const todoKeys = Object.keys(state.todos);
  const todosArray = todoKeys.map(key => state.todos[key]);
  return todosArray;
};

export const stepsByTodoId = (state, todoId) => {
  const stepKeys = Object.keys(state.steps);
  const stepsArray = [];
  stepKeys.forEach(key => {
    if (state.steps[key].todo_id === todoId) {
      stepsArray.push(state.steps[key]);
    }
  });
  return stepsArray;
};
