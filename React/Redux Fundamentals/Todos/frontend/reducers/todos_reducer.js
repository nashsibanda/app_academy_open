import { RECEIVE_TODO, RECEIVE_TODOS } from "./../actions/todo_actions";

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

const todosReducer = (state = initialState, action) => {
  switch (action.type) {
    case RECEIVE_TODOS:
      const newTodos = {};
      action.todos.forEach(todo => {
        newTodos[todo.id] = todo;
      });
      return newTodos;
    case RECEIVE_TODO:
      const newTodo = { [action.todo.id]: action.todo };
      return Object.assign({}, state, newTodo);
    default:
      return state;
  }
};

export default todosReducer;
