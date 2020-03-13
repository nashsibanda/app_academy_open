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
    this.tagNames = this.tagNames.bind(this);
  }

  toggleDetail(e) {
    this.setState({ detail: !this.state.detail }, () => {
      if (this.props.errors.length > 0) {
        this.props.clearErrors();
      }
    });
  }

  toggleDone(e) {
    e.preventDefault();
    e.stopPropagation();
    const newTodo = { todo: this.props.todo };
    newTodo.todo.done = !newTodo.todo.done;
    this.props.updateTodo(newTodo);
  }

  toggleDoneHover(e) {
    e.stopPropagation();
    this.setState({ doneHover: !this.state.doneHover });
  }

  removeSelf(e) {
    e.preventDefault();
    e.stopPropagation();
    this.props.deleteTodo(this.props.todo);
  }

  updateTodo(todo) {
    const newTodo = { todo: todo };
    this.props.updateTodo(newTodo);
  }

  tagNames() {
    let tagNames = this.props.todo.tags.map(tag => tag.name) || [];
    if (tagNames.length > 4) {
      let shorterTagNames = tagNames.slice(0, 4);
      shorterTagNames.push("...");
      return shorterTagNames;
    }
    return tagNames;
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
                  : Util.friendlyDueString(todo.due) === "Due Today!"
                  ? "due-today"
                  : Util.friendlyDueString(todo.due) === "Due this week"
                  ? "due-this-week"
                  : "not-due")
              }
            >
              {todo.done ? "Completed!" : Util.friendlyDueString(todo.due)}
            </span>
          </div>
          <ul className="todo-title-tag-list tag-list">
            {this.tagNames().map(tag => {
              return <li key={todo.created_at + tag}>{tag}</li>;
            })}
          </ul>
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
