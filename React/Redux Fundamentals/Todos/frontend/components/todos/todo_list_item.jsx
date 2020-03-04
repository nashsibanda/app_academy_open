import React from "react";

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.remove = this.remove.bind(this);
    this.toggleDone = this.toggleDone.bind(this);
  }

  remove(e) {
    e.preventDefault();
    this.props.removeTodo(this.props.todo);
  }

  toggleDone(e) {
    e.preventDefault();
    const flippedTodo = Object.assign({}, this.props.todo);
    console.log(flippedTodo);
    flippedTodo.done = !flippedTodo.done;
    this.props.receiveTodo(flippedTodo);
  }

  render() {
    const { todo } = this.props;
    return (
      <li>
        {todo.title} <button onClick={this.remove}>Delete</button>{" "}
        <button onClick={this.toggleDone}>
          {this.props.todo.done ? "Undo" : "Done"}
        </button>
      </li>
    );
  }
}

export default TodoListItem;
