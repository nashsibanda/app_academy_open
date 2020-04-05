import React from "react";
import GreetingContainer from "./greeting_container";
import { Route } from "react-router-dom";
import LoginFormContainer from "./session_form/login_form_container";
import SignupFormContainer from "./session_form/signup_form_container";
import { AuthRoute, ProtectedRoute } from "../util/route_util";
import SearchContainer from "./map/search_container";
import BenchFormContainer from "./benches/bench_form_container";

const App = () => (
  <div>
    <header>
      <h1>Welcome To BenchBnB</h1>
      <GreetingContainer />
    </header>
    <Route exact path="/" component={SearchContainer} />
    <ProtectedRoute exact path="/benches/new" component={BenchFormContainer} />
    <AuthRoute path="/login" component={LoginFormContainer} />
    <AuthRoute path="/signup" component={SignupFormContainer} />
  </div>
);

export default App;
