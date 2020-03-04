import React from "react";
import Util from "../../util/util";

class StepForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { title: "", body: "" };
    this.updateState = this.updateState.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  updateState(property) {
    return e => this.setState({ [property]: e.currentTarget.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    const newStep = Object.assign({}, this.state, {
      id: Util.uniqueId(),
      done: false,
      todo_id: this.props.todo_id
    });
    this.props.receiveStep(newStep);
    this.setState({ title: "", body: "" });
  }

  render() {
    return (
      <form className="step-form" onSubmit={this.handleSubmit}>
        <input
          type="text"
          placeholder="New Step"
          onChange={this.updateState("title")}
          value={this.state.title}
        ></input>
        <input
          type="text"
          placeholder="Description (optional)"
          onChange={this.updateState("body")}
          value={this.state.body}
        ></input>
        <input type="submit" value="Add Step"></input>
      </form>
    );
  }
}

export default StepForm;
