"use strict";
const fs = require("fs");
const path = require("path");

const root = process.cwd();

const targetFiles = [
  "./service-000-storybook/.env",
  "./service-001-gatsby/.env",
  "./service-002-strapi/.env",
  "./service-003-ionic/.env",
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
