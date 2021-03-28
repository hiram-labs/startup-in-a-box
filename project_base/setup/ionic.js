"use strict";

const fs = require("fs");
const path = require("path");
const { populateConfigFile } = require("../utils");

const root = process.cwd();

module.exports = function (answers) {
  const targetFiles = ["package.json"];

  targetFiles.forEach((file) => {
    const configFile = fs
      .readFileSync(path.join(__dirname, `../data/ionic/_${file}`))
      .toString();

    const customisedConfigFile = populateConfigFile(answers, configFile);

    fs.writeFileSync(
      path.join(root, `./service_003_ionic/${file}`),
      customisedConfigFile
    );
  });
};
