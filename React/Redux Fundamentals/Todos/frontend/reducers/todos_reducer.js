import {
  RECEIVE_TODO,
  RECEIVE_TODOS,
  REMOVE_TODO
} from "./../actions/todo_actions";

const initialState = {
  1: {
    id: 1,
    title: "Wash car",
    body: "With soap",
    done: false,
    due: "2020-04-02"
  },
  2: {
    id: 2,
    title: "Wash dog",
    body: "With shampoo",
    done: true
  },
  3: {
    id: 3,
    title: "Take a shower",
    body: "...and be clean",
    done: false,
    due: "2020-03-12"
  },
  4: {
    id: 4,
    title: "Test Todos App",
    body:
      "Hopefully everything should be working alright on the app. It's tricky to know when to stop and when to keep adding new features!",
    done: false,
    due: "2020-03-09"
  }
};

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
