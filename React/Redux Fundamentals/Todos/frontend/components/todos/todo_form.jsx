import React from "react";
import Util from "./../../util/util";

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false
    };
    this.updateDone = this.updateDone.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.submitForm = this.submitForm.bind(this);
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
    this.setState({ done: e.currentTarget.checked });
  }

  submitForm(e) {
    e.preventDefault();
    const newTodo = Object.assign({}, this.state, { id: Util.uniqueId() });
    this.props.submit(newTodo);
    this.setState({ title: "", body: "", done: false });
  }

  render() {
    return (
      <form onSubmit={this.submitForm}>
        <input
          type="text"
          placeholder="Enter Todo title here..."
          onChange={this.updateTitle}
          value={this.state.title}
        ></input>
        <input
          type="text"
          placeholder="Enter more information here..."
          onChange={this.updateBody}
          value={this.state.body}
        ></input>{" "}
        <label htmlFor="done">Done?</label>
        <input
          type="checkbox"
          name="done"
          onChange={this.updateDone}
          checked={this.state.done}
        ></input>
        <input type="submit"></input>
      </form>
    );
  }
}

export default TodoForm;
