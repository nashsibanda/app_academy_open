import React from "react";
import { Route, Link, NavLink, Switch } from "react-router-dom";

import Red from "./red";
import Green from "./green";
import Blue from "./blue";
import Violet from "./violet";
import Orange from "./orange";
import Yellow from "./yellow";
import Indigo from "./indigo";

class Rainbow extends React.Component {
  render() {
    return (
      <div>
        <h1>Rainbow Router!</h1>
        {/* Your links should go here */}
        <Link to="/red">Red</Link>
        <Link to="/red/orange">Orange</Link>
        <Link to="/red/yellow">Yellow</Link>
        <Link to="/green">Green</Link>
        <Link to="/blue">Blue</Link>
        <Link to="/blue/indigo">Indigo</Link>
        <Link to="/violet">Violet</Link>
        <div id="rainbow">
          {/* Your routes should go here */}
          {/* <Switch> */}
          <Route path="/red" component={Red} />
          <Route path="/red/orange" component={Orange} />
          <Route path="/red/yellow" component={Yellow} />
          <Route path="/green" component={Green} />
          <Route path="/blue" component={Blue} />
          <Route path="/blue/indigo" component={Indigo} />
          <Route path="/violet" component={Violet} />
          {/* </Switch> */}
        </div>
      </div>
    );
  }
}

export default Rainbow;
