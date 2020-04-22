import * as SessionAPIUtil from "../util/session_api_util";
import jwt_decode from "jwt-decode";

export const RECEIVE_USER_LOGOUT = "RECEIVE_USER_LOGOUT";

export const receiveUserLogout = () => ({
  type: RECEIVE_USER_LOGOUT,
});

export const logout = () => dispatch => {
  // Remove the token from local storage
  localStorage.removeItem("jwtToken");

  // Remove the token from the common axios header
  SessionAPIUtil.setAuthToken(false);

  // Dispatch a logout action
  dispatch(receiveUserLogout());
};
