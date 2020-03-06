import React from "react";
import Util from "../../util/util";

class StepForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { title: "", body: "", showForm: false };
    this.updateState = this.updateState.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.toggleForm = this.toggleForm.bind(this);
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
    this.setState({ title: "", body: "", showForm: false });
  }

  toggleForm(e) {
    e.preventDefault();
    this.setState({ showForm: !this.state.showForm });
  }

  render() {
    return (
      <div className="step-form-container">
        {this.state.showForm ? (
          <form className="stacked-form" onSubmit={this.handleSubmit}>
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
            <div className="submit-cancel-buttons">
              <button
                type="submit"
                className="fas fa-check icon-button"
              ></button>
              <i
                className="fas fa-times icon-button"
                onClick={this.toggleForm}
              ></i>
            </div>
          </form>
        ) : (
          <a href="#" onClick={this.toggleForm}>
            Add Step...
          </a>
        )}
      </div>
    );
  }
}

export default StepForm;
