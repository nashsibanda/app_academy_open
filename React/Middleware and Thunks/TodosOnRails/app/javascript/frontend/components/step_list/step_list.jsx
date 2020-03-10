import React from "react";
import StepListItemContainer from "./step_list_item_container";
import StepForm from "./step_form";

class StepList extends React.Component {
  constructor(props) {
    super(props);
    this.state = { showSteps: false };
    this.updateStep = this.updateStep.bind(this);
    this.toggleSteps = this.toggleSteps.bind(this);
    this.formSubmitHandler = this.formSubmitHandler.bind(this);
  }

  componentDidMount() {
    this.props.fetchSteps(this.props.todo_id);
  }

  updateStep(updatedStep) {
    this.props.receiveStep(updatedStep);
  }

  formSubmitHandler(newStep) {
    this.props.createStep(newStep);
    this.setState({ showSteps: true });
  }

  toggleSteps(e) {
    e.preventDefault();
    this.setState({ showSteps: !this.state.showSteps });
  }

  render() {
    const { steps, errors, todo_id } = this.props;
    return (
      <div className="steps-container">
        {steps.length > 0 ? (
          this.state.showSteps ? (
            <ul className="step-list">
              <li className="step-list-placeholder-item">
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
              <li className="step-list-placeholder-item">
                <a href="#" onClick={this.toggleSteps}>
                  Show Steps
                </a>
              </li>
            </ul>
          )
        ) : (
          <ul className="step-list">
            <li className="step-list-placeholder-item">No steps added.</li>
          </ul>
        )}
        {(steps.length === 0 || this.state.showSteps) && (
          <StepForm
            formSubmitHandler={this.formSubmitHandler}
            todo_id={todo_id}
            errors={errors}
          />
        )}
      </div>
    );
  }
}

export default StepList;
