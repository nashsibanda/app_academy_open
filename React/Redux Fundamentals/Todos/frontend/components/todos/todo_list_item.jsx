import React from "react";
import TodoDetailViewContainer from "./todo_detail_view_container";

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = { detail: false };
    this.toggleDetail = this.toggleDetail.bind(this);
    this.toggleDone = this.toggleDone.bind(this);
    this.updateTodo = this.updateTodo.bind(this);
  }

  toggleDetail(e) {
    this.setState({ detail: !this.state.detail });
  }

  toggleDone(e) {
    e.preventDefault();
    const flippedTodo = Object.assign({}, this.props.todo);
    console.log(flippedTodo);
    flippedTodo.done = !flippedTodo.done;
    this.props.receiveTodo(flippedTodo);
  }

  updateTodo(newTodo) {
    this.props.receiveTodo(newTodo);
  }

  render() {
    const { todo } = this.props;
    return (
      <li>
        <span className="todo-title" onClick={this.toggleDetail}>
          {todo.title}
        </span>{" "}
        <button onClick={this.toggleDone}>
          {this.props.todo.done ? "Undo" : "Done"}
        </button>
        {this.state.detail && (
          <TodoDetailViewContainer
            todo={todo}
            updateTodo={this.updateTodo}
            receiveStep={this.props.receiveStep}
          />
        )}
      </li>
    );
  }
}

export default TodoListItem;
