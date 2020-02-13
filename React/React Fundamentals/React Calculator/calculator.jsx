import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = { result: 0, num1: "", num2: "", warning1: false, warning2: false, warningAny: false};
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.clear = this.clear.bind(this);
    this.showWarning1 = this.showWarning1.bind(this);
    this.showWarning2 = this.showWarning2.bind(this);
    this.hideWarning1 = this.hideWarning1.bind(this);
    this.hideWarning2 = this.hideWarning2.bind(this);
    this.anyWarnings = this.anyWarnings.bind(this);
  }

  setNum1(e) {
    e.preventDefault();
    if (e.currentTarget.value) {
      const num1 = e.currentTarget.value;
      console.log(isNaN(Number(num1)));
      if (isNaN(num1)) {
        this.showWarning1();
      } else {
        this.setState({ num1 }, () => {
          this.hideWarning1();
        });
      }
    } else {
      this.setState({ num1: "" }, () => {
        this.hideWarning1();
      });
    }
  }

  setNum2(e) {
    e.preventDefault();
    if (e.currentTarget.value) {
      const num2 = e.currentTarget.value;
      if (isNaN(Number(num2))) {
        this.showWarning2();
      } else {
        this.setState({num2}, () => {
          this.hideWarning2();
        });
      }
    } else {
      this.setState({ num2: "" }, () => {
        this.hideWarning2();
      });
    }
  }

  clear(e) {
    e.preventDefault();
    this.setState({num1: "", num2: ""});
  }

  showWarning1() {
    this.setState({warning1: true }, () => {
      this.anyWarnings();
    });
  }

  showWarning2() {
    this.setState({warning2: true }, () => {
      this.anyWarnings();
    });
  }

  hideWarning1() {
    this.setState({warning1: false}, () => {
      this.anyWarnings();
    });
  }

  hideWarning2() {
    this.setState({warning2: false}, () => {
      this.anyWarnings();
    });
  }

  anyWarnings() {
    if (this.state.warning1 || this.state.warning2) {
      this.setState({warningAny: true});
    } else {
      this.setState({warningAny: false});
    }
  }

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
        {this.state.warningAny &&
          <p className="warning-banner">Please only enter numbers!</p>
        }
        <input type="text" onChange={this.setNum1} value={String(this.state.num1)}></input>
        <input type="text" onChange={this.setNum2} value={String(this.state.num2)}></input>
        <button onClick={this.clear}>Clear</button>
      </div>
    )
  }
}

export default Calculator;