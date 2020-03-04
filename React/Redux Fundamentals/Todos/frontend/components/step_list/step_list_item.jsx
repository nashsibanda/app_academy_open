import React from "react";

class StepListItem extends React.Component {
  constructor(props) {
    super(props);
    this.toggleDone = this.toggleDone.bind(this);
    this.removeStep = this.removeStep.bind(this);
  }

  toggleDone(e) {
    e.preventDefault();
    const toggledStep = Object.assign({}, this.props.step);
    toggledStep.done = !toggledStep.done;
    this.props.receiveStep(toggledStep);
  }

  removeStep(e) {
    e.preventDefault();
    this.props.removeStep(this.props.step);
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
            <span className="step-details-label">Title:</span> {step.title}
          </li>
          {step.body && (
            <li>
              <span className="step-details-label">Body:</span> {step.body}
            </li>
          )}
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
