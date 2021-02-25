"use strict";

const services = require("../services/commit-db");

/**
 * commit-db.js controller
 *
 * @description: A set of functions called "actions" of the `commit-db` plugin.
 */

module.exports = {
  /**
   * Default action.
   *
   * @return {Object}
   */

  index: async (ctx) => {
    services.dumpDBToFile();
    ctx.send({
      message: "ok",
    });
  },
};
