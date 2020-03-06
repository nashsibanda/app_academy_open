import React from "react";

class StepListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: this.props.step.title,
      body: this.props.step.body,
      editTitle: false,
      editBody: false
    };
    this.toggleDone = this.toggleDone.bind(this);
    this.removeStep = this.removeStep.bind(this);
    this.sendStepToParent = this.sendStepToParent.bind(this);
    this.toggleEdit = this.toggleEdit.bind(this);
    this.updateProperty = this.updateProperty.bind(this);
  }

  toggleDone(e) {
    e.preventDefault();
    const toggledStep = Object.assign({}, this.props.step);
    toggledStep.done = !toggledStep.done;
    this.props.receiveStep(toggledStep);
  }

  toggleEdit(property) {
    return e => this.setState({ [property]: !this.state[property] });
  }

  removeStep(e) {
    e.preventDefault();
    this.props.removeStep(this.props.step);
  }

  sendStepToParent(e, property) {
    e.preventDefault();
    const updatedStep = Object.assign({}, this.props.step);
    updatedStep[property] = this.state[property];
    this.props.handleUpdate(updatedStep);
    this.setState({ editBody: false, editTitle: false });
  }

  updateProperty(property) {
    return e => this.setState({ [property]: e.currentTarget.value });
  }

  render() {
    const { step, stepNumber } = this.props;
    return (
      <li className="step-list-item">
        Step {stepNumber}:{" "}
        <button onClick={this.toggleDone}>{step.done ? "Undo" : "Done"}</button>
        <button onClick={this.removeStep}>Remove</button>
        <ul>
          <li>
            <span className="step-details-label">Title:</span>{" "}
            {this.state.editTitle ? (
              <form
                onSubmit={e => {
                  this.sendStepToParent(e, "title");
                }}
              >
                <input
                  type="text"
                  placeholder="Enter step title..."
                  onChange={this.updateProperty("title")}
                  value={this.state.title}
                ></input>
                <input type="submit" value="Update" />
                <button onClick={this.toggleEdit("editTitle")}>Cancel</button>
              </form>
            ) : (
              <span className="step-details-content">
                {step.title}{" "}
                <button onClick={this.toggleEdit("editTitle")}>Edit</button>
              </span>
            )}
          </li>
          <li>
            <span className="step-details-label">Body:</span>{" "}
            {this.state.editBody ? (
              <form
                onSubmit={e => {
                  this.sendStepToParent(e, "body");
                }}
              >
                <input
                  type="text"
                  placeholder="Description (optional)..."
                  onChange={this.updateProperty("body")}
                  value={this.state.body}
                ></input>
                <input type="submit" value="Update" />
                <button onClick={this.toggleEdit("editBody")}>Cancel</button>
              </form>
            ) : (
              <span className="step-details-content">
                {step.body}{" "}
                <button onClick={this.toggleEdit("editBody")}>
                  {this.state.body ? "Edit" : "Add"}
                </button>
              </span>
            )}
          </li>
          <li>
            <span className="step-details-label">Status:</span>{" "}
            {step.done ? "Done" : "Not Done"}
          </li>
        </ul>
      </li>
    );
  }
}

export default StepListItem;
