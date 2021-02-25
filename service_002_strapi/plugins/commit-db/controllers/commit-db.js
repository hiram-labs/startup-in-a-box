"use strict";

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
    ctx.send({
      message: "Succesfully updated db dump file.",
    });
  },
};
