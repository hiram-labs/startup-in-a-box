"use strict";

const fs = require("fs");
const path = require("path");
const { populateConfigFile } = require("../../utils");

const root = process.cwd();

module.exports = async (answers) => {
  const targetFiles = ["package"];

  targetFiles.forEach((file) => {
    const configFile = fs
      .readFileSync(path.join(__dirname, `../../data/ionic/${file}`))
      .toString();

    const customisedConfigFile = populateConfigFile(answers, configFile);

    fs.writeFileSync(
      path.join(root, `./service-003-ionic/${file}.json`),
      customisedConfigFile
    );
  });
};
