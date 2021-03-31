"use strict";

const fs = require("fs");
const path = require("path");

const root = process.cwd();

module.exports = async (answers) => {
  const env = {};
  const serviceNames = ["storybook", "gatsby", "strapi", "ionic"];

  serviceNames.forEach((serviceName) => {
    env[serviceName] = fs
      .readFileSync(path.join(__dirname, `../../env/${serviceName}/dev.env`))
      .toString()
      .concat('"')
      .replace(/=/g, ':"')
      .replace(/\n/g, '",\n');
  });

  const targetFiles = ["ecosystem.config.js"];

  targetFiles.forEach((file) => {
    const configFile = fs
      .readFileSync(path.join(__dirname, `../../data/base/_${file}`))
      .toString();

    const customisedConfigFile = configFile
      .replace(/{{service: storybook}}/g, `{${env["storybook"]}}`)
      .replace(/{{service: gatsby}}/g, `{${env["gatsby"]}}`)
      .replace(/{{service: strapi}}/g, `{${env["strapi"]}}`)
      .replace(/{{service: ionic}}/g, `{${env["ionic"]}}`);

    fs.writeFileSync(path.join(root, `./${file}`), customisedConfigFile);
  });
};
