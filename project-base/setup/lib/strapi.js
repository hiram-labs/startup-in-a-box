"use strict";

const fs = require("fs");
const path = require("path");
const ora = require("ora");
const { exec } = require("child_process");
const {
  populateConfigFile,
  progressStarting,
  progressFinishing,
} = require("../../utils");

const root = process.cwd();

module.exports = async (answers) => {
  const targetFiles = ["package.json"];

  targetFiles.forEach((file) => {
    const configFile = fs
      .readFileSync(path.join(__dirname, `../../data/strapi/_${file}`))
      .toString();

    const customisedConfigFile = populateConfigFile(answers, configFile);

    fs.writeFileSync(
      path.join(root, `./service-002-strapi/${file}`),
      customisedConfigFile
    );
  });

  const packagePath = path.join(root, `./service-002-strapi`);
  const spinner = ora(progressStarting()).start();
  exec(
    `cd ${packagePath} && yarn setup-strapi && yarn dump-db && docker stop mysql_db && docker stop adminer`,
    (error, stdout, stderr) => {
      if (error) {
        throw error;
      }
      console.log(`stdout: ${stdout}`);
      // console.log(`stderr: ${stderr}`);
      spinner.text = progressFinishing();
      setTimeout(() => spinner.stop(), 5000);
    }
  );
};
