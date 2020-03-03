import React from "react";
import TodoListItem from "./todo_list_item";

// export default () => <h3>Todo list goes here!</h3>;

class TodoList extends React.Component {
  constructor(props) {
    super(props);
    this.todos = props.todos;
  }

  render() {
    const todos = this.todos;
    return (
      <ul>
        {todos.map((todo, index) => {
          return <TodoListItem todo={todo} key={index} />;
        })}
      </ul>
    );
  }
}

export default TodoList;
