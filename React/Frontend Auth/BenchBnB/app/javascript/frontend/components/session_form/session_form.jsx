import React from "react";
import { Link, Redirect } from "react-router-dom";

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: "",
      email: "",
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateProperty = this.updateProperty.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  updateProperty(property) {
    return e => {
      this.setState({ [property]: e.target.value });
    };
  }

  render() {
    const { formType, errors, loggedIn } = this.props;
    const { username, password, email } = this.state;
    const formHeader = () => {
      switch (formType) {
        case "signup":
          return "Sign Up";
        case "login":
          return "Log In";
      }
    };

    const redirectLink = () => {
      switch (formType) {
        case "signup":
          return "/login";
        case "login":
          return "/signup";
      }
    };

    const redirectLinkTitle = () => {
      switch (formType) {
        case "signup":
          return "Already registered? Click here to log in...";
        case "login":
          return "Not yet registered? Click here to sign up...";
      }
    };

    return (
      <div className="session-form-container">
        <form
          className={"session-form " + formType}
          onSubmit={this.handleSubmit}
        >
          <h2>{formHeader()}</h2>
          <input
            type="text"
            placeholder="Username"
            onChange={this.updateProperty("username")}
            value={this.state.username}
          ></input>
          {formType === "signup" && (
            <input
              type="email"
              placeholder="Email address"
              onChange={this.updateProperty("email")}
              value={this.state.email}
            ></input>
          )}
          <input
            type="password"
            placeholder="Password"
            onChange={this.updateProperty("password")}
            value={this.state.password}
          ></input>
          <button type="submit">{formHeader()}</button>
          <Link to={redirectLink()}>{redirectLinkTitle()}</Link>
          {errors.length > 0 && (
            <ul className="session-errors">
              {errors.map(error => {
                return <li key={error}>{error}</li>;
              })}
            </ul>
          )}
        </form>
      </div>
    );
  }
}

export default SessionForm;
