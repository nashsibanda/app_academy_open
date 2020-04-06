import React from "react";
import GreetingContainer from "./greeting_container";
import { Route, Switch } from "react-router-dom";
import LoginFormContainer from "./session_form/login_form_container";
import SignupFormContainer from "./session_form/signup_form_container";
import { AuthRoute, ProtectedRoute } from "../util/route_util";
import SearchContainer from "./map/search_container";
import BenchFormContainer from "./benches/bench_form_container";
import BenchShowContainer from "./benches/bench_show_container";

const App = () => (
  <div>
    <header>
      <h1>Welcome To BenchBnB</h1>
      <GreetingContainer />
    </header>
    <Switch>
      <Route exact path="/benches/:benchId" component={BenchShowContainer} />
      <AuthRoute path="/login" component={LoginFormContainer} />
      <AuthRoute path="/signup" component={SignupFormContainer} />
      <ProtectedRoute
        exact
        path="/benches/new"
        component={BenchFormContainer}
      />
      <Route exact path="/" component={SearchContainer} />
    </Switch>
  </div>
);

export default App;
