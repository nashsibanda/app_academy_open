import * as SessionAPIUtil from "../util/session_api_util";
import jwt_decode from "jwt-decode";

export const RECEIVE_USER_LOGOUT = "RECEIVE_USER_LOGOUT";
export const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS";
export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_USER_SIGN_IN = "RECEIVE_USER_SIGN_IN";

// We'll dispatch this when our user signs in
export const receiveCurrentUser = currentUser => ({
  type: RECEIVE_CURRENT_USER,
  currentUser,
});

// This will be used to redirect the user to the login page upon signup
export const receiveUserSignIn = () => ({
  type: RECEIVE_USER_SIGN_IN,
});

// We dispatch this one to show authentication errors on the frontend
export const receiveSessionErrors = errors => ({
  type: RECEIVE_SESSION_ERRORS,
  errors,
});

// When our user is logged out, we will dispatch this action to set isAuthenticated to false
export const receiveUserLogout = () => ({
  type: RECEIVE_USER_LOGOUT,
});

// Upon signup, dispatch the appropriate action depending on which type of response we receive from the backend
export const signup = user => dispatch =>
  SessionAPIUtil.signup(user).then(
    () => dispatch(receiveUserSignIn()),
    err => dispatch(receiveSessionErrors(err.response.data))
  );

// Upon login, set the session token and dispatch the current user. Dispatch errors on failure
export const login = user => dispatch =>
  SessionAPIUtil.login(user)
    .then(res => {
      const { token } = res.data;
      localStorage.setItem("jwtToken", token);
      SessionAPIUtil.setAuthToken(token);
      const decodedUser = jwt_decode(token);
      dispatch(receiveCurrentUser(decodedUser));
    })
    .catch(err => {
      dispatch(receiveSessionErrors(err.response.data));
    });

export const logout = () => dispatch => {
  // Remove the token from local storage
  localStorage.removeItem("jwtToken");

  // Remove the token from the common axios header
  SessionAPIUtil.setAuthToken(false);

  // Dispatch a logout action
  dispatch(receiveUserLogout());
};
