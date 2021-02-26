"use strict";

const util = require("util");
const exec = util.promisify(require("child_process").exec);

module.exports = async (ctx, next) => {
  const { stdout, stderr } = await exec("yarn dump-db");
  if (stderr) {
    ctx.unauthorized(stderr);
    return;
  }
  ctx.send({ message: stdout.split("#").reverse()[0] });
};
