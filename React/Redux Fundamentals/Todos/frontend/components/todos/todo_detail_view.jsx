import React from "react";
import StepListContainer from "./../step_list/step_list_container";

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      editTitle: false,
      editBody: false,
      title: this.props.todo.title,
      body: this.props.todo.body
    };
    this.sendTodoToParent = this.sendTodoToParent.bind(this);
    this.toggleForm = this.toggleForm.bind(this);
    this.updateProperty = this.updateProperty.bind(this);
  }

  sendTodoToParent(e, property) {
    e.preventDefault();
    const updatedTodo = Object.assign({}, this.props.todo);
    updatedTodo[property] = this.state[property];
    this.props.updateTodo(updatedTodo);
    this.setState({ editBody: false, editTitle: false });
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
              ></input>
              <i className="fas fa-check icon-button">
                <input type="submit" value="" />
              </i>
              <i
                className="fas fa-undo icon-button"
                onClick={this.toggleForm("editTitle")}
              ></i>
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
          <span className="todo-details-label">Body:</span>{" "}
          {this.state.editBody ? (
            <form
              className="inline-form"
              onSubmit={e => {
                this.sendTodoToParent(e, "body");
              }}
            >
              <input
                type="text"
                placeholder="Enter todo body..."
                value={this.state.body}
                onChange={this.updateProperty("body")}
              ></input>
              <i className="fas fa-check icon-button">
                <input type="submit" value="" />
              </i>
              <i
                className="fas fa-undo icon-button"
                onClick={this.toggleForm("editBody")}
              ></i>{" "}
            </form>
          ) : (
            <span className="todo-details-content">
              {todo.body}{" "}
              <i
                className="fas fa-edit icon-button"
                onClick={this.toggleForm("editBody")}
              ></i>
            </span>
          )}
        </li>
        <li>
          <span className="todo-details-label">Status:</span>{" "}
          {todo.done ? "Completed" : "Not Completed"}
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
