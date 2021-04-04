"use strict";

const fs = require("fs");
const path = require("path");
const { populateConfigFile } = require("../../utils");

const root = process.cwd();

module.exports = async (answers) => {
  const targetFiles = ["package", "env"];

  targetFiles.forEach((file) => {
    const configFile = fs
      .readFileSync(path.join(__dirname, `../../data/selenium/${file}`))
      .toString();

    const customisedConfigFile = populateConfigFile(answers, configFile);

    file === targetFiles[0] &&
      fs.writeFileSync(
        path.join(root, `./service-000-selenium/${file}.json`),
        customisedConfigFile
      );
    file === targetFiles[1] &&
      fs.writeFileSync(
        path.join(root, `./service-000-selenium/src/.chalk/lib/${file}.sh`),
        customisedConfigFile
      );
  });
};
