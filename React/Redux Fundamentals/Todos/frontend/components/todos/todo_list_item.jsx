import React from "react";
import TodoDetailViewContainer from "./todo_detail_view_container";

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = { detail: true, doneHover: false };
    this.toggleDetail = this.toggleDetail.bind(this);
    this.toggleDone = this.toggleDone.bind(this);
    this.updateTodo = this.updateTodo.bind(this);
    this.removeSelf = this.removeSelf.bind(this);
    this.toggleDoneHover = this.toggleDoneHover.bind(this);
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

  toggleDoneHover(e) {
    this.setState({ doneHover: !this.state.doneHover });
  }

  removeSelf(e) {
    e.preventDefault();
    this.props.removeTodo(this.props.todo);
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
        {/* <button onClick={this.toggleDone}>
          {this.props.todo.done ? "Undo" : "Done"}
        </button> */}
        <i
          className={
            "fas icon-button " +
            (todo.done
              ? "done-true " +
                (this.state.doneHover ? "fa-circle" : "fa-check-circle")
              : "done-false " +
                (this.state.doneHover ? "fa-check-circle" : "fa-circle"))
          }
          onClick={this.toggleDone}
          onMouseEnter={this.toggleDoneHover}
          onMouseLeave={this.toggleDoneHover}
        ></i>
        <i
          className="fas fa-times-circle icon-button"
          onClick={this.removeSelf}
        ></i>
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
