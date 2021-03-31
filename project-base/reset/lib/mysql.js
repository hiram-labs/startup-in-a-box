"use strict";
const fs = require("fs");
const path = require("path");

module.exports = async () => {
  const root = process.cwd();

  const targetFiles = ["init.sql"];
  targetFiles.forEach((file) => {
    fs.copyFile(
      path.join(__dirname, `../../data/mysql/_${file}`),
      path.join(root, `./service-000-mysql/backup/${file}`),
      (err) => {
        if (err) throw err;
      }
    );
  });
};
