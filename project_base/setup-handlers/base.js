"use strict";

const fs = require("fs");
const path = require("path");

const root = process.cwd();

module.exports = function (answers) {
  const gatsbyEnv = fs
    .readFileSync(path.join(__dirname, `../env/gatsby/dev.env`))
    .toString()
    .concat('"')
    .replace(/=/g, ':"')
    .replace(/\n/g, '",\n');
  const strapiEnv = fs
    .readFileSync(path.join(__dirname, `../env/strapi/dev.env`))
    .toString()
    .concat('"')
    .replace(/=/g, ':"')
    .replace(/\n/g, '",\n');
  const ionicEnv = fs
    .readFileSync(path.join(__dirname, `../env/ionic/dev.env`))
    .toString()
    .concat('"')
    .replace(/=/g, ':"')
    .replace(/\n/g, '",\n');

  const targetFiles = ["ecosystem.config.js"];

  targetFiles.forEach((file) => {
    const configFile = fs
      .readFileSync(path.join(__dirname, `../data/base/_${file}`))
      .toString();

    const customisedConfigFile = configFile
      .replace(/{ service: gatsby }/g, `{${gatsbyEnv}}`)
      .replace(/{ service: strapi }/g, `{${strapiEnv}}`)
      .replace(/{ service: ionic }/g, `{${ionicEnv}}`);

    fs.writeFileSync(path.join(root, `./${file}`), customisedConfigFile);
  });
};
