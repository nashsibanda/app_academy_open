import React from "react";
import StepListItemContainer from "./step_list_item_container";

class StepList extends React.Component {
  constructor(props) {
    super(props);
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
                stepNumber={index}
              />
            );
          })}
        </ul>
        {/* <StepForm /> */}
      </div>
    );
  }
}

export default StepList;
