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
        <ul>
          {todos.map((todo, index) => {
            return (
              <TodoListItem
                todo={todo}
                key={index}
                removeTodo={removeTodo}
                receiveTodo={receiveTodo}
              />
            );
          })}
        </ul>
      </div>
    );
  }
}

export default TodoList;
