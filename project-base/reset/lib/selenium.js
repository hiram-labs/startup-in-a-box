"use strict";
const fs = require("fs");
const path = require("path");

module.exports = async () => {
  const root = process.cwd();

  const targetFiles = ["package"];
  targetFiles.forEach((file) => {
    fs.copyFile(
      path.join(__dirname, `../../data/selenium/${file}`),
      path.join(root, `./service-000-selenium/${file}.json`),
      (err) => {
        if (err) throw err;
      }
    );
  });
};
