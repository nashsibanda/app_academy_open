import React from "react";

class ErrorList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    // console.log(this.props);
    return (
      <ul className="error-list">
        {this.props.errors.map((error, index) => {
          return (
            <li key={index}>
              <i className="fas fa-exclamation-triangle"></i>
              {error}
            </li>
          );
        })}
      </ul>
    );
  }
}

export default ErrorList;
