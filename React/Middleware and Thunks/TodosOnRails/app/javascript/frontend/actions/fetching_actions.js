export const FETCHING_ON = "FETCHING_ON";
export const FETCHING_OFF = "FETCHING_OFF";

export const fetchingOn = () => {
  return {
    type: FETCHING_ON
  };
};

export const fetchingOff = () => {
  return {
    type: FETCHING_OFF
  };
};
