"use strict";

const inquirer = require("inquirer");

const initialSetup = require("../setup");
const factoryReset = require("../reset");

const { isRequired, oneOff, answeredYes } = require("../utils");
const {
  resetConfig,
  organisation,
  analytics,
} = require("../data/base/wizard.config");

// catch inquirer errors
const onError = (error) => {
  if (error.isTtyError) {
    console.error("An error ocurred with your TTY environment");
  } else {
    console.error(error, "Something went wrong");
  }
};

module.exports = {
  // initial setup inquirer prompts
  setup: async (serviceName) => {
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
          when: (answers) => answeredYes(answers[analytics.gtagEnable.field]),
          validate: isRequired,
        },
      ])
      .then((answers) => {
        initialSetup(serviceName, answers);
      })
      .catch(onError);
  },

  // reset to factory settings inquirer prompts
  reset: async (serviceName) => {
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
        answeredYes(answers[resetConfig.confirmReset.field])
          ? factoryReset(serviceName, answers)
          : process.exit(0);
      })
      .catch(onError);
  },
};
