"use strict";

const path = require("path");
const rimraf = require("rimraf");

module.exports = {
  /**
   * blocks async loop
   * @param {number} ms
   * @returns
   */
  blockingSleep: (ms) => new Promise((resolve) => setTimeout(resolve, ms)),
  // TODO:
  // add styling to these shell prompts
  /**
   * shows cli progress prompts
   * @returns
   */
  progressStarting: () => "Setting up ...",
  /**
   * shows cli progress prompts
   * @returns
   */
  progressFinishing: () => "Cleaning up ...",
  /**
   * checks user selected yes
   * @param {string} answer
   * @returns
   */
  answeredYes: (answer) => {
    return answer.match(/^y$/i);
  },
  /**
   * forces a user input
   * @param {string | undefined} answer
   * @returns
   */
  isRequired: (answer) => {
    return !!answer ? true : "Required";
  },
  /**
   * matches a y or n answer
   * @param {string | undefined} answer
   * @returns
   */
  oneOff: (answer) => {
    if (answer.match(/^y$/i)) return true;
    if (answer.match(/^n$/i)) return true;
    return "Invalid input";
  },
  /**
   * cleans up dependencies
   */
  removeServicesDependencies: () => {
    const root = process.cwd();

    rimraf(path.join(root, `./*/yarn.lock`), () => {});
    rimraf(path.join(root, `./*/node_modules`), () => {});
    rimraf(path.join(root, `./*/package-lock.json`), () => {});
  },

  /**
   * insert user answer into config files
   * @param {object} answer
   * @param {string} template
   * @returns
   */
  populateConfigFile: (answer, template) => {
    return template
      .replace(/{{gtagID}}/g, answer["gtagID"] || `{{gtagID}}`)
      .replace(/{{companyName}}/g, answer["companyName"])
      .replace(/{{companyDescription}}/g, answer["companyDescription"])
      .replace(
        /{{maintainerName}}/g,
        `${answer["maintainerName"]} <${answer["maintainerEmail"]}>`
      )
      .replace(
        /{{companyNameShort}}/g,
        answer["companyName"].slice(0, 4).toLowerCase().replace(" ", "")
      );
  },
};
