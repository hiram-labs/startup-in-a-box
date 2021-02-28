"use strict";

module.exports = {
  isRequired: (value) => {
    return !!value ? true : "Required";
  },
};
