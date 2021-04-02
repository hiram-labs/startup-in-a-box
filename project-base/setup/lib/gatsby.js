"use strict";

const fs = require("fs");
const path = require("path");
const { populateConfigFile } = require("../../utils");

const root = process.cwd();

module.exports = async (answers) => {
  const targetFiles = ["package.json"];

  targetFiles.forEach((file) => {
    const configFile = fs
      .readFileSync(
        path.join(path.join(__dirname, `../../data/gatsby/${file}`))
      )
      .toString();

    const customisedConfigFile = populateConfigFile(answers, configFile);

    fs.writeFileSync(
      path.join(root, `./service-001-gatsby/${file}.json`),
      customisedConfigFile
    );
  });
};
