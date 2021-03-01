const inquirer = require("inquirer");

const setupGatsby = require("../setup-handlers/gatsby");
const setupStrapi = require("../setup-handlers/strapi");
const setupIonic = require("../setup-handlers/ionic");

const { isRequired, oneOff, isYes } = require("../utils");
const {
  organisation,
  analytics,
  strapiConfig,
} = require("../data/inquirer-config");

module.exports = async () => {
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
      console.log("\nSetting up...\n");

      setupGatsby(answers);

      console.log("\nSetup complete\n");
    })
    .catch((error) => {
      if (error.isTtyError) {
        console.error("An error ocurred with your TTY environment");
      } else {
        console.error(error, "Something went wrong");
      }
    });
};
