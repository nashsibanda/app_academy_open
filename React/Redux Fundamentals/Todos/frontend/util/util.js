const Util = {
  uniqueId() {
    return new Date().getTime();
  },
  overdueCheck(dateString) {
    if (dateString) {
      const now = new Date();
      const dateToCheck = new Date(dateString);
      return now > dateToCheck;
    } else {
      return false;
    }
  },
  friendlyDueString(dateString) {
    if (dateString) {
      const now = new Date();
      const dateToCheck = new Date(dateString);
      if (now > dateToCheck) {
        return "Overdue!";
      } else if (dateToCheck - now < 604800000) {
        return "Due this week";
      } else {
        return "Not due for a while";
      }
    } else {
      return "No deadline";
    }
  },
  dueSoonCheck(dateString) {
    if (dateString) {
      const now = new Date();
      const dateToCheck = new Date(dateString);
      if (dateToCheck - now < 604800000) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
};

export default Util;
