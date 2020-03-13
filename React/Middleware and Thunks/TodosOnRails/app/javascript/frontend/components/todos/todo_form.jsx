import React from "react";

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      due: "",
      done: false,
      tag_names: [],
      current_tag: "",
      showForm: false,
      showBodyInput: false,
      showDueInput: false,
      showTagInput: false
    };
    this.updateDone = this.updateDone.bind(this);
    this.updateDue = this.updateDue.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.updateCurrentTag = this.updateCurrentTag.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.submitForm = this.submitForm.bind(this);
    this.toggleForm = this.toggleForm.bind(this);
    this.toggleBodyInput = this.toggleBodyInput.bind(this);
    this.toggleDueInput = this.toggleDueInput.bind(this);
    this.toggleTagInput = this.toggleTagInput.bind(this);
    this.addTag = this.addTag.bind(this);
    this.removeTag = this.removeTag.bind(this);
    this.waitAndUpdate = this.waitAndUpdate.bind(this);
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

  updateCurrentTag(e) {
    e.preventDefault();
    if (e.currentTarget.value) {
      if (e.currentTarget.value[0] === "#") {
        this.setState({ current_tag: e.currentTarget.value.substring(1) });
      } else {
        this.setState({ current_tag: e.currentTarget.value });
      }
    } else {
      this.setState({ current_tag: "" });
    }
  }

  updateDue(e) {
    e.preventDefault();
    if (e.currentTarget.value) {
      this.setState({ due: e.currentTarget.value });
    } else {
      this.setState({ due: "" });
    }
  }

  updateDone(e) {
    e.stopPropagation();
    this.setState({ done: e.currentTarget.checked });
  }

  addTag(e) {
    if (e.key === "Enter") {
      e.preventDefault();
      e.stopPropagation();
      let tags = this.state.tag_names;
      tags.push(this.state.current_tag.trim().toLowerCase());
      let uniqTags = [...new Set(tags)];
      this.setState({ tag_names: uniqTags, current_tag: "" });
    }
  }

  removeTag(e, tag_name) {
    e.preventDefault();
    let tags = this.state.tag_names.filter(element => element != tag_name);
    this.setState({ tag_names: tags });
  }

  toggleForm() {
    this.setState({ showForm: !this.state.showForm }, () => {
      if (!this.state.showForm) {
        this.setState(
          {
            title: "",
            body: "",
            due: "",
            done: false,
            showBodyInput: false,
            showDueInput: false
          },
          () => {
            if (this.props.errors.length > 0) {
              this.props.clearErrors();
            }
          }
        );
      }
    });
  }

  toggleBodyInput(e) {
    e.preventDefault();
    e.stopPropagation();
    this.setState({ showBodyInput: !this.state.showBodyInput });
  }

  toggleDueInput(e) {
    e.preventDefault();
    e.stopPropagation();
    this.setState({ showDueInput: !this.state.showDueInput });
  }

  toggleTagInput(e) {
    e.preventDefault();
    e.stopPropagation();
    this.setState({ showTagInput: !this.state.showTagInput });
  }

  submitForm(e) {
    e.preventDefault();
    e.stopPropagation();
    const formValues = (({ title, body, due, done, tag_names }) => ({
      title,
      body,
      due,
      done,
      tag_names
    }))(this.state);
    const newTodo = { todo: formValues };
    this.props.submit(newTodo);
    setTimeout(this.waitAndUpdate, 100);
  }

  waitAndUpdate() {
    if (this.props.fetching) {
      setTimeout(this.waitAndUpdate, 100);
    } else if (this.props.errors.length === 0) {
      this.setState(
        {
          title: "",
          body: "",
          due: "",
          tag_names: [],
          done: false,
          showBodyInput: false,
          showDueInput: false
        },
        this.toggleForm
      );
    }
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
              disabled={this.props.fetching}
            ></input>
            {this.state.showBodyInput ? (
              <span className="toggleable-text-input">
                <textarea
                  placeholder="Description"
                  onChange={this.updateBody}
                  value={this.state.body}
                  disabled={this.props.fetching}
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
            {this.state.showDueInput ? (
              <span className="toggleable-text-input">
                <input
                  type="date"
                  onChange={this.updateDue}
                  value={this.state.due}
                  disabled={this.props.fetching}
                ></input>
                <i
                  className="fas fa-times icon-button"
                  onClick={this.toggleDueInput}
                ></i>
              </span>
            ) : (
              <a href="#" onClick={this.toggleDueInput}>
                Add due date...
              </a>
            )}
            {this.state.showTagInput ? (
              <div className="todo-form-tags">
                <span className="toggleable-text-input">
                  <input
                    type="text"
                    onKeyPress={this.addTag}
                    onChange={this.updateCurrentTag}
                    value={this.state.current_tag}
                    disabled={this.props.fetching}
                  ></input>
                  <i
                    className="fas fa-times icon-button"
                    onClick={this.toggleTagInput}
                  ></i>
                </span>
                <ul className="tag-list form-tag-list">
                  {this.state.tag_names.map(tag_name => {
                    return (
                      <li
                        key={tag_name}
                        onClick={e => this.removeTag(e, tag_name)}
                      >
                        {tag_name} <i className="fas fa-times"></i>
                      </li>
                    );
                  })}
                </ul>
              </div>
            ) : (
              <a href="#" onClick={this.toggleTagInput}>
                Add tags...
              </a>
            )}

            <button
              type="submit"
              className="form-button"
              value="Submit"
              disabled={this.props.fetching}
            >
              Submit
              <i
                className={
                  "left-padded-icon fas " +
                  (this.props.fetching
                    ? "fa-spinner fetching-wait"
                    : "fa-sticky-note")
                }
              ></i>
            </button>
          </form>
        )}
      </div>
    );
  }
}

export default TodoForm;
