"use strict";
const fs = require("fs");
const path = require("path");

const root = process.cwd();

const targetFiles = [
  "./service_000_storybook/.env",
  "./service_001_gatsby/.env",
  "./service_002_strapi/.env",
  "./service_003_ionic/.env",
];
const sourceFiles = [
  `../env/storybook/dev.env`,
  `../env/gatsby/dev.env`,
  `../env/strapi/dev.env`,
  `../env/ionic/dev.env`,
];

module.exports = (answers) => {
  sourceFiles.forEach((file, index) => {
    fs.copyFile(
      path.join(__dirname, file),
      path.join(root, targetFiles[index]),
      (err) => {
        if (err) throw err;
      }
    );
  });
};
