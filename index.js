const inquirer = require("inquirer");
const boxen = require("boxen");
const setupGatsby = require("./project_base/setup-handlers/gatsby");
const { isRequired } = require("./project_base/utils");
const {
  setupConfig,
  organisation,
  strapiConfig,
} = require("./project_base/data");

console.log(boxen(setupConfig.introMessage, { padding: 1 }));
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
      console.error("Something went wrong");
    }
  });
