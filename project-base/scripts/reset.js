"use strict";

const boxen = require("boxen");
const { reset } = require("../setup/inquirer");
const { resetConfig } = require("../data/base/inquirer-config");
const [, , serviceName] = process.argv;
const boxenConfig = {
  padding: 1,
};

console.log(boxen(resetConfig.introMessage, boxenConfig));
reset(serviceName);
