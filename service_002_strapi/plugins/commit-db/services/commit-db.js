"use strict";

const { exec } = require("child_process");
const axios = require("axios");

/**
 * commit-db.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

module.exports = {
  dumpDBToFile: () => {
    exec("npm run dump-db", (err) => {
      if (err) {
        console.error(err);
        return;
      }
    });
  },
};
