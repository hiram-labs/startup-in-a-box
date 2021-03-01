"use strict";

const fs = require("fs");
const path = require("path");
const { exec, spawn } = require("child_process");

const root = process.cwd();

module.exports = function (answers) {
  const {
    companyName,
    maintainerName,
    companyDescription,
    maintainerEmail,
  } = answers;

  const targetFiles = ["package.json"];

  targetFiles.forEach((file) => {
    const configFile = fs
      .readFileSync(path.join(__dirname, `../data/strapi/_${file}`))
      .toString();

    const customisedConfigFile = configFile
      .replace(/<companyName>/g, companyName)
      .replace(/<companyDescription>/g, companyDescription)
      .replace(/<maintainerName>/g, `${maintainerName} <${maintainerEmail}>`);

    fs.writeFileSync(
      path.join(root, `./service_002_strapi/${file}`),
      customisedConfigFile
    );
  });

  const packagePath = path.join(root, `./service_002_strapi`);
  exec(
    `cd ${packagePath} && yarn setup-strapi && yarn dump-db && docker stop mysql_db`,
    (error, stdout, stderr) => {
      if (error) {
        throw error;
      }
      console.log(`stdout: ${stdout}`);
      console.log(`stderr: ${stderr}`);
    }
  );
};
