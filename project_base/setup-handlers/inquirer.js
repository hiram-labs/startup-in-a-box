"use strict";

const inquirer = require("inquirer");

const setupBase = require("../setup-handlers/base");
const setupEnv = require("../setup-handlers/env");
const setupStorybook = require("../setup-handlers/storybook");
const setupGatsby = require("../setup-handlers/gatsby");
const setupStrapi = require("../setup-handlers/strapi");
const setupIonic = require("../setup-handlers/ionic");

const resetAll = require("../reset-handlers");

const { isRequired, oneOff } = require("../utils");
const {
  resetConfig,
  organisation,
  analytics,
} = require("../data/base/inquirer-config");

module.exports = {
  setup: async () => {
    inquirer
      .prompt([
        {
          type: "input",
          name: organisation.companyName.field,
          message: organisation.companyName.prompt,
          default: organisation.companyName.placeholder,
          validate: isRequired,
        },
        {
          type: "input",
          name: organisation.companyDescription.field,
          message: organisation.companyDescription.prompt,
          default: organisation.companyDescription.placeholder,
          validate: isRequired,
        },
        {
          type: "input",
          name: organisation.maintainerName.field,
          message: organisation.maintainerName.prompt,
          default: organisation.maintainerName.placeholder,
          validate: isRequired,
        },
        {
          type: "input",
          name: organisation.maintainerEmail.field,
          message: organisation.maintainerEmail.prompt,
          default: organisation.maintainerEmail.placeholder,
          validate: isRequired,
        },
        {
          type: "input",
          name: analytics.gtagEnable.field,
          message: analytics.gtagEnable.prompt,
          validate: oneOff,
        },
        {
          type: "input",
          name: analytics.gtagID.field,
          message: analytics.gtagID.prompt,
          default: analytics.gtagID.placeholder,
          when: (answers) => answers[analytics.gtagEnable.field].match(/^y$/i),
          validate: isRequired,
        },
      ])
      .then((answers) => {
        setupBase(answers);
        setupEnv(answers);
        setupStorybook(answers);
        setupGatsby(answers);
        setupStrapi(answers);
        setupIonic(answers);
      })
      .catch((error) => {
        if (error.isTtyError) {
          console.error("An error ocurred with your TTY environment");
        } else {
          console.error(error, "Something went wrong");
        }
      });
  },
  reset: async (args) => {
    inquirer
      .prompt([
        {
          type: "input",
          name: resetConfig.confirmReset.field,
          message: resetConfig.confirmReset.prompt,
          validate: oneOff,
        },
      ])
      .then((answers) => {
        answers[resetConfig.confirmReset.field].match(/^y$/i)
          ? resetAll(args)
          : process.exit(0);
      })
      .catch((error) => {
        if (error.isTtyError) {
          console.error("An error ocurred with your TTY environment");
        } else {
          console.error(error, "Something went wrong");
        }
      });
  },
};
