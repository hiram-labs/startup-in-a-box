"use strict";
const fs = require("fs");
const path = require("path");

const root = process.cwd();

const sourceFiles = [
  `../../env/gatsby/dev.env`,
  `../../env/gcloud/dev.env`,
  `../../env/ionic/dev.env`,
  `../../env/selenium/dev.env`,
  `../../env/storybook/dev.env`,
  `../../env/strapi/dev.env`,
  `../../env/mysql/dev.env`,
];

const targetFiles = [
  "./service-001-gatsby/.env",
  "./service-000-gcloud/scripts/shell/chalk/lib/env.sh",
  "./service-003-ionic/.env",
  "./service-000-selenium/.env",
  "./service-000-storybook/.env",
  "./service-002-strapi/.env",
  "./service-000-mysql/.env",
];

module.exports = async (answers) => {
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