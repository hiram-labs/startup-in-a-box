"use strict";

const { reset } = require("../wizard");
const { resetConfig } = require("../data/base/wizard.config");

const [, , serviceName] = process.argv;

console.log(resetConfig.introMessage);
reset(serviceName);
