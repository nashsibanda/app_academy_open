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
        <NavLink exact to="/red">
          Red
        </NavLink>
        <NavLink to="/red/orange">Orange</NavLink>
        <NavLink to="/red/yellow">Yellow</NavLink>
        <NavLink to="/green">Green</NavLink>
        <NavLink exact to="/blue">
          Blue
        </NavLink>
        <NavLink to="/blue/indigo">Indigo</NavLink>
        <NavLink to="/violet">Violet</NavLink>
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
