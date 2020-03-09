import React from "react";
import TodoDetailViewContainer from "./todo_detail_view_container";
import Util from "../../util/util";

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = { detail: false, doneHover: false };
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
    e.stopPropagation();
    const flippedTodo = Object.assign({}, this.props.todo);
    flippedTodo.done = !flippedTodo.done;
    this.props.receiveTodo(flippedTodo);
  }

  toggleDoneHover(e) {
    e.stopPropagation();
    this.setState({ doneHover: !this.state.doneHover });
  }

  removeSelf(e) {
    e.preventDefault();
    e.stopPropagation();
    this.props.removeTodo(this.props.todo);
  }

  updateTodo(newTodo) {
    this.props.receiveTodo(newTodo);
  }

  render() {
    const { todo } = this.props;
    return (
      <li className="todo-list-item">
        <div className="todo-list-item-title" onClick={this.toggleDetail}>
          <i
            className={
              "fas icon-button todo-done " +
              (todo.done
                ? "done-true fa-check-circle"
                : "done-false " +
                  (this.state.doneHover ? "fa-check-circle" : "fa-circle"))
            }
            onClick={this.toggleDone}
            onMouseEnter={this.toggleDoneHover}
            onMouseLeave={this.toggleDoneHover}
          ></i>
          <div className="todo-title-and-due">
            <span className="todo-title">{todo.title}</span>
            <span
              className={
                "friendly-due-string " +
                (todo.done
                  ? "friendly-done"
                  : Util.friendlyDueString(todo.due) === "Overdue!"
                  ? "overdue"
                  : Util.friendlyDueString(todo.due) === "Due this week"
                  ? "due-this-week"
                  : "not-due")
              }
            >
              {todo.done ? "Completed!" : Util.friendlyDueString(todo.due)}
            </span>
          </div>
          <i
            className="fas fa-times-circle icon-button todo-delete-icon"
            onClick={this.removeSelf}
          ></i>
        </div>
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
