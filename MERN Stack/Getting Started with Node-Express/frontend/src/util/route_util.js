import React from "react";
import { Route, Redirect, withRouter } from "react-router-dom";
import { connect } from "react-redux";

const Auth = ({ component: Component, path, loggedIn, exact }) => (
  <Route
    path={path}
    exact={exact}
    render={props =>
      !loggedIn ? (
        <Component {...props} />
      ) : (
        // Redirect to the tweets page if the user is authenticated
        <Redirect to="/tweets" />
      )
    }
  />
);

const Protected = ({ component: Component, loggedIn, ...rest }) => (
  <Route
    {...rest}
    render={props =>
      loggedIn ? (
        <Component {...props} />
      ) : (
        // Redirect to the login page if the user isn't already authenticated
        <Redirect to="/login" />
      )
    }
  />
);

// Use the isAuthenticated slice of state to determine whether a user is logged in

const mapStateToProps = state => ({
  loggedIn: state.session.isAuthenticated,
});

export const AuthRoute = withRouter(connect(mapStateToProps, null)(Auth));
export const ProtectedRoute = withRouter(
  connect(mapStateToProps, null)(Protected)
);
