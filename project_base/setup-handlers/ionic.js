"use strict";

const fs = require("fs");
const path = require("path");

const root = process.cwd();

module.exports = function (answers) {
  const {
    companyName,
    maintainerName,
    companyDescription,
    maintainerEmail,
    gtagID,
  } = answers;

  const targetFiles = ["package.json"];

  targetFiles.forEach((file) => {
    const configFile = fs
      .readFileSync(path.join(__dirname, `../data/ionic/_${file}`))
      .toString();

    const customisedConfigFile = configFile
      .replace(/<gtagID>/g, gtagID || `<gtagID>`)
      .replace(/<companyName>/g, companyName)
      .replace(/<companyDescription>/g, companyDescription)
      .replace(/<maintainerName>/g, `${maintainerName} <${maintainerEmail}>`)
      .replace(
        /<companyNameShort>/g,
        companyName.slice(0, 4).toLowerCase().replace(" ", "")
      );

    fs.writeFileSync(
      path.join(root, `./service_003_ionic/${file}`),
      customisedConfigFile
    );
  });
};
