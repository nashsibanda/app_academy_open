import React from "react";
import { withRouter } from "react-router-dom";

class LoginForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      email: "",
      password: "",
      errors: {},
    };
    this.renderErrors = this.renderErrors.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.update = this.update.bind(this);
  }

  // Once the user has been authenticated, redirect to the Tweets page
  componentDidUpdate(prevProps, prevState) {
    if (this.props.currentUser === true) {
      this.props.history.push("/tweets");
    }
    // Set or clear errors
    if (prevState.errors !== this.props.errors) {
      this.setState({ errors: this.props.errors });
    }
  }

  update(field) {
    return e => this.setState({ [field]: e.currentTarget.value });
  }

  handleSubmit(e) {
    e.preventDefault();

    const { email, password } = this.state;

    let user = {
      email,
      password,
    };

    this.props.login(user);
  }

  renderErrors() {
    const { errors } = this.state;
    return (
      <ul>
        {Object.keys(errors).map((error, i) => (
          <li key={`error-${i}`}>{errors[error]}</li>
        ))}
      </ul>
    );
  }

  render() {
    const { email, password } = this.state;
    return (
      <div className="login-form-container">
        <form onSubmit={this.handleSubmit}>
          <div>
            <input
              type="text"
              value={email}
              onChange={this.update("email")}
              placeholder="Email"
            />
            <br />
            <input
              type="password"
              value={password}
              onChange={this.update("password")}
              placeholder="Password"
            />
            <br />
            <input type="submit" value="Submit" />
            {this.renderErrors()}
          </div>
        </form>
      </div>
    );
  }
}

export default withRouter(LoginForm);
