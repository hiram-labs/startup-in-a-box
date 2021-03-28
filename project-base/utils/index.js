"use strict";

module.exports = {
  // async sleep
  blockingSleep: (ms) => new Promise((resolve) => setTimeout(resolve, ms)),

  // inquirer helper to force a user input
  isRequired: (answer) => {
    return !!answer ? true : "Required";
  },

  // inquirer helper which matches a y or n answer
  oneOff: (answer) => {
    if (answer.match(/^y$/i)) return true;
    if (answer.match(/^n$/i)) return true;
    return "Invalid input";
  },

  // insert user answer into config files
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
