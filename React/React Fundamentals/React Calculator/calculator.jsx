import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = { result: 0, num1: "", num2: "", warning1: false, warning2: false, warningAny: false};
    //#region Function bindings
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.clear = this.clear.bind(this);
    this.showWarning1 = this.showWarning1.bind(this);
    this.showWarning2 = this.showWarning2.bind(this);
    this.hideWarning1 = this.hideWarning1.bind(this);
    this.hideWarning2 = this.hideWarning2.bind(this);
    this.anyWarnings = this.anyWarnings.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    //#endregion
  }

//#region Number state setters
  setNum1(e) {
    e.preventDefault();
    if (e.currentTarget.value) {
      const num1 = e.currentTarget.value;
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
//#endregion

  clear(e) {
    e.preventDefault();
    this.setState({result: 0, num1: "", num2: ""});
  }
//#region Warnings for non-numbers
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
//#endregion

//#region Mathematical operation functions

  add(e) {
    e.preventDefault();
    this.setState({ result: Number(this.state.num1) + Number(this.state.num2)})
  }

  subtract(e) {
    e.preventDefault();
    this.setState({ result: Number(this.state.num1) - Number(this.state.num2)})
  }

  multiply(e) {
    e.preventDefault();
    this.setState({ result: Number(this.state.num1) * Number(this.state.num2)})
  }

  divide(e) {
    e.preventDefault();
    this.setState({ result: Number(this.state.num1) / Number(this.state.num2)})
  }

//#endregion

  render() {
    const {num1, num2, result, warningAny} = this.state;
    const {add, subtract, multiply, divide, setNum1, setNum2, clear} = this;
    return (
      <div>
        <h1>{result}</h1>
        {warningAny &&
          <p className="warning-banner">Please only enter numbers!</p>
        }
        <input type="text" onChange={setNum1} value={String(num1)}></input>
        <input type="text" onChange={setNum2} value={String(num2)}></input>
        <button onClick={clear}>Clear</button>
        <div className="operator-btns">
          <button onClick={add}> + </button>
          <button onClick={subtract}> - </button>
          <button onClick={multiply}> x </button>
          <button onClick={divide}> ÷ </button>
        </div>
      </div>
    )
  }
}

export default Calculator;