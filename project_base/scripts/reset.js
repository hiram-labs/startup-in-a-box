"use strict";

const boxen = require("boxen");
const reset = require("../reset-handlers");
const { resetConfig } = require("../data/base/inquirer-config");
const [, , service] = process.argv;
const boxenConfig = {
  padding: 1,
};

console.log(boxen(resetConfig.introMessage, boxenConfig));
reset(service);
