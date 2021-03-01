"use strict";

const inquirer = require("inquirer");
const boxen = require("boxen");
const setup = require("./project_base/setup-handlers//inquirer");
const reset = require("./project_base/reset-handlers");

const {
  setupConfig,
  resetConfig,
} = require("./project_base/data/inquirer-config");
const [, , resetFlag, service] = process.argv;
const flagged = resetFlag === "-r";

console.log(
  boxen(flagged ? resetConfig.introMessage : setupConfig.introMessage, {
    padding: 1,
  })
);

flagged ? reset(service) : setup();
