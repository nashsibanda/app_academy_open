import React from "react";
import StepListItemContainer from "./step_list_item_container";
import StepForm from "./step_form";

class StepList extends React.Component {
  constructor(props) {
    super(props);
    this.state = { showSteps: false };
    this.updateStep = this.updateStep.bind(this);
    this.toggleSteps = this.toggleSteps.bind(this);
  }

  updateStep(updatedStep) {
    this.props.receiveStep(updatedStep);
  }

  toggleSteps(e) {
    e.preventDefault();
    this.setState({ showSteps: !this.state.showSteps });
  }

  render() {
    const { steps } = this.props;
    return (
      <div className="steps-container">
        {steps.length > 0 ? (
          this.state.showSteps ? (
            <ul className="step-list">
              <li className="step-list-item">
                <a href="#" onClick={this.toggleSteps}>
                  Hide Steps
                </a>
              </li>
              {steps.map((step, index) => {
                return (
                  <StepListItemContainer
                    step={step}
                    key={step.id}
                    stepNumber={index + 1}
                    handleUpdate={this.updateStep}
                  />
                );
              })}
            </ul>
          ) : (
            <ul className="step-list">
              <li className="step-list-item">
                <a href="#" onClick={this.toggleSteps}>
                  Show Steps
                </a>
              </li>
            </ul>
          )
        ) : (
          <ul className="step-list">
            <li className="step-list-item">No steps added.</li>
          </ul>
        )}
        <StepForm
          receiveStep={this.props.receiveStep}
          todo_id={this.props.todo_id}
        />
      </div>
    );
  }
}

export default StepList;
