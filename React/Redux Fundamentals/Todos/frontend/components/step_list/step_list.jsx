import React from "react";
import StepListItemContainer from "./step_list_item_container";
import StepForm from "./step_form";

class StepList extends React.Component {
  constructor(props) {
    super(props);
    this.updateStep = this.updateStep.bind(this);
  }

  updateStep(updatedStep) {
    this.props.receiveStep(updatedStep);
  }

  render() {
    const { steps } = this.props;
    return (
      <div className="steps-container">
        <ul className="step-list">
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
        <StepForm
          receiveStep={this.props.receiveStep}
          todo_id={this.props.todo_id}
        />
      </div>
    );
  }
}

export default StepList;
