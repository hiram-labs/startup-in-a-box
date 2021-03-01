"use strict";

module.exports = {
  isRequired: (value) => {
    return !!value ? true : "Required";
  },
  oneOff: (value) => {
    if (value.match(/^y$/i)) return true;
    if (value.match(/^n$/i)) return true;
    return "Invalid input";
  },
};
