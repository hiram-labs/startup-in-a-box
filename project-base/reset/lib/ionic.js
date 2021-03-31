"use strict";
const fs = require("fs");
const path = require("path");

module.exports = async () => {
  const root = process.cwd();

  const targetFiles = ["package.json"];
  targetFiles.forEach((file) => {
    fs.copyFile(
      path.join(__dirname, `../../data/ionic/_${file}`),
      path.join(root, `./service-003-ionic/${file}`),
      (err) => {
        if (err) throw err;
      }
    );
  });
};
