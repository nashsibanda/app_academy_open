import StepApi from "../util/step_api_util";
import { clearErrors, receiveErrors } from "./error_actions";

export const RECEIVE_STEPS = "RECEIVE_STEPS";
export const RECEIVE_STEP = "RECEIVE_STEP";
export const REMOVE_STEP = "REMOVE_STEP";

export const receiveSteps = steps_array => {
  return {
    type: RECEIVE_STEPS,
    steps: steps_array
  };
};

export const receiveStep = step => {
  return {
    type: RECEIVE_STEP,
    step: step
  };
};

export const removeStep = step => {
  return {
    type: REMOVE_STEP,
    step: step
  };
};

export const fetchSteps = todo_id => dispatch => {
  StepApi.fetchSteps(todo_id).then(steps => dispatch(receiveSteps(steps)));
};

export const createStep = step => dispatch => {
  StepApi.createStep(step).then(
    step => {
      dispatch(receiveStep(step));
      dispatch(clearErrors());
    },
    err => dispatch(receiveErrors(err.responseJSON))
  );
};

export const updateStep = step => dispatch => {
  StepApi.updateStep(step).then(
    step => {
      dispatch(receiveStep(step));
      dispatch(clearErrors());
    },
    err => dispatch(receiveErrors(err.responseJSON))
  );
};

export const deleteStep = step => dispatch => {
  StepApi.deleteStep(step).then(
    step => {
      dispatch(removeStep(step));
      dispatch(clearErrors());
    },
    err => dispatch(receiveErrors(err.responseJSON))
  );
};
