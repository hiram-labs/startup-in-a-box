"use strict";
const fs = require("fs");
const path = require("path");

module.exports = async () => {
  const root = process.cwd();

  const targetFiles = ["package.json"];
  targetFiles.forEach((file) => {
    fs.copyFile(
      path.join(__dirname, `../../data/strapi/_${file}`),
      path.join(root, `./service-002-strapi/${file}`),
      (err) => {
        if (err) throw err;
      }
    );
  });
};
