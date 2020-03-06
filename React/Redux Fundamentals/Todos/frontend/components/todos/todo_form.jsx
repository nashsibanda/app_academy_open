import React from "react";
import Util from "./../../util/util";

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false,
      showForm: false,
      showBodyInput: false
    };
    this.updateDone = this.updateDone.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.submitForm = this.submitForm.bind(this);
    this.toggleForm = this.toggleForm.bind(this);
    this.toggleBodyInput = this.toggleBodyInput.bind(this);
  }

  updateTitle(e) {
    e.preventDefault();
    if (e.currentTarget.value) {
      this.setState({ title: e.currentTarget.value });
    } else {
      this.setState({ title: "" });
    }
  }

  updateBody(e) {
    e.preventDefault();
    if (e.currentTarget.value) {
      this.setState({ body: e.currentTarget.value });
    } else {
      this.setState({ body: "" });
    }
  }

  updateDone(e) {
    e.stopPropagation();
    this.setState({ done: e.currentTarget.checked });
  }

  toggleForm() {
    this.setState({ showForm: !this.state.showForm });
  }

  toggleBodyInput(e) {
    e.preventDefault();
    e.stopPropagation();
    this.setState({ showBodyInput: !this.state.showBodyInput });
  }

  submitForm(e) {
    e.preventDefault();
    const newTodo = Object.assign({}, this.state, { id: Util.uniqueId() });
    this.props.submit(newTodo);
    this.setState({ title: "", body: "", done: false }, this.toggleForm());
  }

  render() {
    return (
      <div className="new-todo-form-container">
        <button className="form-button" onClick={this.toggleForm}>
          Add Todo<i className="left-padded-icon fas fa-sticky-note"></i>
        </button>
        <div
          className={"new-todo-modal " + (this.state.showForm ? "" : "hidden")}
          onClick={this.toggleForm}
        ></div>
        {this.state.showForm && (
          <form onSubmit={this.submitForm} className="new-todo-form">
            <h2>New Todo</h2>
            <input
              type="text"
              placeholder="Title"
              onChange={this.updateTitle}
              value={this.state.title}
            ></input>
            {this.state.showBodyInput ? (
              <span className="toggleable-text-input">
                <textarea
                  placeholder="Description"
                  onChange={this.updateBody}
                  value={this.state.body}
                ></textarea>
                <i
                  className="fas fa-times icon-button"
                  onClick={this.toggleBodyInput}
                ></i>
              </span>
            ) : (
              <a href="#" onClick={this.toggleBodyInput}>
                Add description...
              </a>
            )}
            <div className="done-selector">
              <label htmlFor="done">Done?</label>
              <input
                type="checkbox"
                name="done"
                onChange={this.updateDone}
                checked={this.state.done}
              ></input>
            </div>
            {/* <input className="form-button" type="submit"></input> */}
            <button type="submit" className="form-button" value="Submit">
              Submit
              <i className="left-padded-icon fas fa-sticky-note"></i>
            </button>
          </form>
        )}
      </div>
    );
  }
}

export default TodoForm;
