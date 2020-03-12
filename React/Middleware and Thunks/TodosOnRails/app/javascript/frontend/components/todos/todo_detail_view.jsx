import React from "react";
import StepListContainer from "../step_list/step_list_container";
import Util from "../../util/util";

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      editTitle: false,
      editBody: false,
      editDue: false,
      editDueTime: false,
      addTag: false,
      currentTag: "",
      title: this.props.todo.title,
      body: this.props.todo.body || "",
      due: this.props.todo.due || "",
      tag_names: this.props.todo.tags.map(tag => tag.name) || []
    };
    this.sendTodoToParent = this.sendTodoToParent.bind(this);
    this.toggleForm = this.toggleForm.bind(this);
    this.updateProperty = this.updateProperty.bind(this);
    this.removeTag = this.removeTag.bind(this);
    this.addTag = this.addTag.bind(this);
  }

  sendTodoToParent(e, property) {
    e.preventDefault();
    const updatedTodo = Object.assign({}, this.props.todo);
    updatedTodo[property] = this.state[property];
    this.props.updateTodo(updatedTodo);
    this.setState({ editBody: false, editTitle: false, editDue: false });
  }

  addTag(e) {
    e.preventDefault();
    const newTagNames = this.state.tag_names.concat(this.state.currentTag);
    this.setState(
      {
        tag_names: newTagNames,
        editBody: false,
        editTitle: false,
        editDue: false,
        currentTag: ""
      },
      () => {
        let updatedTodo = Object.assign({}, this.props.todo, {
          tag_names: this.state.tag_names
        });
        this.props.updateTodo(updatedTodo);
      }
    );
  }

  removeTag(e, tag_name) {
    e.preventDefault();
    let tags = this.state.tag_names.filter(element => element != tag_name);
    this.setState({ tag_names: tags }, () => {
      let updatedTodo = Object.assign({}, this.props.todo, {
        tag_names: this.state.tag_names
      });
      if (updatedTodo.tag_names.length === 0) {
        updatedTodo.tag_names = ["NULLNULLNULL"];
      }
      this.props.updateTodo(updatedTodo);
    });
  }

  updateProperty(property) {
    return e => this.setState({ [property]: e.currentTarget.value });
  }

  toggleForm(property) {
    return e => this.setState({ [property]: !this.state[property] });
  }

  render() {
    const { todo } = this.props;
    return (
      <ul className="todo-details">
        <li>
          <span className="todo-details-label">Title:</span>{" "}
          {this.state.editTitle ? (
            <form
              className="inline-form"
              onSubmit={e => {
                this.sendTodoToParent(e, "title");
              }}
            >
              <input
                type="text"
                placeholder="Enter todo title..."
                value={this.state.title}
                onChange={this.updateProperty("title")}
                disabled={this.props.fetching}
              ></input>
              <div
                className={
                  "submit-cancel-buttons " + this.props.fetching
                    ? "disabled"
                    : ""
                }
              >
                <button
                  className="fas fa-check icon-button"
                  type="submit"
                ></button>
                <i
                  className="fas fa-undo-alt icon-button"
                  onClick={this.toggleForm("editTitle")}
                ></i>
              </div>
            </form>
          ) : (
            <span className="todo-details-content">
              {todo.title}{" "}
              <i
                className="fas fa-edit icon-button"
                onClick={this.toggleForm("editTitle")}
              ></i>
            </span>
          )}
        </li>
        <li>
          <span className="todo-details-label">Details:</span>{" "}
          {this.state.editBody ? (
            <form
              className="inline-form"
              onSubmit={e => {
                this.sendTodoToParent(e, "body");
              }}
            >
              <textarea
                placeholder="Enter todo details..."
                value={this.state.body}
                onChange={this.updateProperty("body")}
              ></textarea>
              <div
                className={
                  "submit-cancel-buttons " + this.props.fetching
                    ? "disabled"
                    : ""
                }
              >
                <button
                  className="fas fa-check icon-button"
                  type="submit"
                ></button>
                <i
                  className="fas fa-undo-alt icon-button"
                  onClick={this.toggleForm("editBody")}
                ></i>
              </div>
            </form>
          ) : (
            <span className="todo-details-content">
              {todo.body}{" "}
              <i
                className={
                  "fas icon-button " + (todo.body ? "fa-edit" : "fa-plus")
                }
                onClick={this.toggleForm("editBody")}
              ></i>
            </span>
          )}
        </li>
        <li className="todo-details-status-row">
          <span>
            <span className="todo-details-label">Status:</span>
            <span className="todo-details-content">
              {todo.done
                ? "Completed"
                : Util.overdueCheck(todo.due)
                ? "Overdue"
                : "Not Completed"}
            </span>
          </span>
          <span>
            <span className="todo-details-label">Due:</span>
            {this.state.editDue ? (
              <form
                className="stacked-form"
                onSubmit={e => {
                  this.sendTodoToParent(e, "due");
                }}
              >
                <input
                  type="date"
                  placeholder="Enter todo details..."
                  value={this.state.due}
                  onChange={this.updateProperty("due")}
                  disabled={this.props.fetching}
                ></input>
                <div
                  className={
                    "submit-cancel-buttons " + this.props.fetching
                      ? "disabled"
                      : ""
                  }
                >
                  <button
                    className="fas fa-check icon-button"
                    type="submit"
                  ></button>
                  <i
                    className="fas fa-undo-alt icon-button"
                    onClick={this.toggleForm("editDue")}
                  ></i>
                </div>
              </form>
            ) : (
              <span className="todo-details-content">
                {(todo.due ? todo.due : "No Deadline") + " "}
                <i
                  className={
                    "fas icon-button " + (todo.due ? "fa-edit" : "fa-plus")
                  }
                  onClick={this.toggleForm("editDue")}
                ></i>
              </span>
            )}
          </span>
        </li>
        <li>
          <span className="todo-details-label">Tags:</span>{" "}
          {this.state.tag_names.length > 0 && (
            <span className="todo-details-content">
              <ul className="tag-list">
                {this.state.tag_names.map(tag_name => {
                  return (
                    <li
                      key={`${todo.id}-${tag_name}`}
                      onClick={e => this.removeTag(e, tag_name)}
                    >
                      {tag_name}
                      {"  "}
                      <i className="fas fa-times"></i>
                    </li>
                  );
                })}
              </ul>
            </span>
          )}
          {this.state.addTag ? (
            <form
              className="inline-form add-tags-container"
              onSubmit={e => {
                this.addTag(e);
              }}
            >
              <input
                type="text"
                placeholder="Enter tag name..."
                value={this.state.currentTag}
                onChange={this.updateProperty("currentTag")}
                className="narrow-text-input"
                disabled={this.props.fetching}
              ></input>
              <div
                className={
                  "submit-cancel-buttons " + this.props.fetching
                    ? "disabled"
                    : ""
                }
              >
                <button
                  className="fas fa-check icon-button"
                  type="submit"
                ></button>
                <i
                  className="fas fa-undo-alt icon-button"
                  onClick={this.toggleForm("addTag")}
                ></i>
              </div>
            </form>
          ) : (
            <span className="add-tags-container">
              <button
                className="add-tags-button"
                onClick={this.toggleForm("addTag")}
              >
                Add Tags <i className={"fas fa-plus"}></i>
              </button>
            </span>
          )}
        </li>
        <li className="todo-steps-container">
          <span className="todo-details-label">Steps:</span>
          <StepListContainer
            todo_id={todo.id}
            updateStep={this.props.receiveStep}
          />
        </li>
      </ul>
    );
  }
}

export default TodoDetailView;
