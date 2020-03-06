import React from "react";

class StepListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: this.props.step.title,
      body: this.props.step.body,
      editTitle: false,
      editBody: false,
      doneHover: false
    };
    this.toggleDone = this.toggleDone.bind(this);
    this.removeStep = this.removeStep.bind(this);
    this.sendStepToParent = this.sendStepToParent.bind(this);
    this.toggleEdit = this.toggleEdit.bind(this);
    this.updateProperty = this.updateProperty.bind(this);
    this.toggleDoneHover = this.toggleDoneHover.bind(this);
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

  toggleDoneHover(e) {
    this.setState({ doneHover: !this.state.doneHover });
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
        <i
          className={
            "fas icon-button " +
            (step.done
              ? "done-true " +
                (this.state.doneHover ? "fa-circle" : "fa-check-circle")
              : "done-false " +
                (this.state.doneHover ? "fa-check-circle" : "fa-circle"))
          }
          onClick={this.toggleDone}
          onMouseEnter={this.toggleDoneHover}
          onMouseLeave={this.toggleDoneHover}
        ></i>
        <i
          className="fas fa-times-circle icon-button"
          onClick={this.removeStep}
        ></i>
        <ul>
          <li>
            <span className="step-details-label">Title:</span>{" "}
            {this.state.editTitle ? (
              <form
                className="inline-form"
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
                <i className="fas fa-check icon-button">
                  <input type="submit" value="" />
                </i>
                <i
                  className="fas fa-undo icon-button"
                  onClick={this.toggleEdit("editTitle")}
                ></i>
              </form>
            ) : (
              <span className="step-details-content">
                {step.title}{" "}
                <i
                  className="fas fa-edit icon-button"
                  onClick={this.toggleEdit("editTitle")}
                ></i>
              </span>
            )}
          </li>
          <li>
            <span className="step-details-label">Body:</span>{" "}
            {this.state.editBody ? (
              <form
                className="inline-form"
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
                <i
                  className="fas fa-undo icon-button"
                  onClick={this.toggleEdit("editBody")}
                ></i>
              </form>
            ) : (
              <span className="step-details-content">
                {step.body}{" "}
                <i
                  className={"fas fa-edit icon-button"}
                  onClick={this.toggleEdit("editBody")}
                ></i>
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
