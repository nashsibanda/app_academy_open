import React from "react";
import TodoListItem from "./todo_list_item";
import TodoForm from "./todo_form";

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { todos, receiveTodo, removeTodo } = this.props;
    return (
      <div className="todos">
        <TodoForm submit={receiveTodo} />
        <ul className="todo-list">
          <h2 className="todo-list-header">Your Todos</h2>
          {todos.map((todo, index) => {
            return (
              <TodoListItem
                todo={todo}
                key={index}
                receiveTodo={receiveTodo}
                removeTodo={removeTodo}
              />
            );
          })}
        </ul>
      </div>
    );
  }
}

export default TodoList;
