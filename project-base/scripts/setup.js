"use strict";

const { spawn } = require("child_process");

const { setup } = require("../wizard");
const { setupConfig } = require("../data/base/wizard.config");

const [, , serviceName] = process.argv;

spawn("yarn", [`start:database:container`]);

console.log(setupConfig.introMessage);
setup(serviceName);
