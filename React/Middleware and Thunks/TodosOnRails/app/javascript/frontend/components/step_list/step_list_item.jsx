import React from "react";

class StepListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: this.props.step.title,
      body: this.props.step.body,
      done: this.props.step.done,
      id: this.props.step.id,
      editTitle: false,
      editBody: false,
      doneHover: false,
      showDetails: false
    };
    this.toggleDone = this.submit.bind(this);
    this.removeStep = this.removeStep.bind(this);
    this.toggleEdit = this.toggleEdit.bind(this);
    this.updateProperty = this.updateProperty.bind(this);
    this.toggleDoneHover = this.toggleDoneHover.bind(this);
    this.toggleDetails = this.toggleDetails.bind(this);
  }

  submit(e, toggle = false) {
    e.preventDefault();
    e.stopPropagation();
    let newStep = (({ title, body, done, id }) => ({
      title,
      body,
      done,
      id
    }))(this.state);
    if (toggle) {
      newStep.done = !newStep.done;
    }
    newStep = { step: newStep };
    this.props.updateStep(newStep);
    this.setState({
      done: newStep.step.done,
      editBody: false,
      editTitle: false
    });
  }

  toggleEdit(property) {
    return e => this.setState({ [property]: !this.state[property] });
  }

  toggleDoneHover(e) {
    this.setState({ doneHover: !this.state.doneHover });
  }

  toggleDetails(e) {
    this.setState({ showDetails: !this.state.showDetails });
  }

  removeStep(e) {
    e.preventDefault();
    e.stopPropagation();
    this.props.deleteStep(this.props.step);
  }

  updateProperty(property) {
    return e => this.setState({ [property]: e.currentTarget.value });
  }

  render() {
    const { step, stepNumber } = this.props;
    return (
      <li className="step-list-item">
        <div className="step-title" onClick={this.toggleDetails}>
          <i
            className={
              "fas step-done icon-button " +
              (this.state.done
                ? "done-true fa-check-circle"
                : "done-false " +
                  (this.state.doneHover ? "fa-check-circle" : "fa-circle"))
            }
            onClick={e => {
              this.submit(e, true);
            }}
            onMouseEnter={this.toggleDoneHover}
            onMouseLeave={this.toggleDoneHover}
          ></i>
          <strong className="step-number">{stepNumber}</strong>
          <span
            className={
              "step-title " +
              (step.done ? "step-title-done" : "step-title-not-done")
            }
          >
            {step.title}
          </span>
          <i
            className="fas fa-times-circle icon-button step-delete-icon"
            onClick={this.removeStep}
          ></i>
        </div>
        {this.state.showDetails && (
          <ul className="step-details">
            <li>
              <span className="step-details-label">Title:</span>{" "}
              {this.state.editTitle ? (
                <form
                  className="inline-form"
                  onSubmit={e => {
                    this.submit(e);
                  }}
                >
                  <input
                    type="text"
                    placeholder="Enter step title..."
                    onChange={this.updateProperty("title")}
                    value={this.state.title}
                  ></input>
                  <div className="submit-cancel-buttons">
                    <button
                      type="submit"
                      className="fas fa-check icon-button"
                    ></button>
                    <i
                      className="fas fa-undo icon-button"
                      onClick={this.toggleEdit("editTitle")}
                    ></i>
                  </div>
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
              <span className="step-details-label">Details:</span>{" "}
              {this.state.editBody ? (
                <form
                  className="inline-form"
                  onSubmit={e => {
                    this.submit(e);
                  }}
                >
                  <textarea
                    placeholder="Description (optional)..."
                    onChange={this.updateProperty("body")}
                    value={this.state.body}
                  ></textarea>
                  <div className="submit-cancel-buttons">
                    <button
                      type="submit"
                      className="fas fa-check icon-button"
                    ></button>{" "}
                    <i
                      className="fas fa-undo icon-button"
                      onClick={this.toggleEdit("editBody")}
                    ></i>
                  </div>
                </form>
              ) : (
                <span className="step-details-content">
                  {step.body}{" "}
                  <i
                    className={
                      "fas icon-button " + (step.body ? "fa-edit" : "fa-plus")
                    }
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
        )}
      </li>
    );
  }
}

export default StepListItem;
