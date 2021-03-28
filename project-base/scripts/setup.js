"use strict";

const path = require("path");
const { spawn } = require("child_process");
const boxen = require("boxen");
const { setup } = require("../setup/inquirer");
const { setupConfig } = require("../data/base/inquirer-config");

const boxenConfig = {
  padding: 1,
};

const dockerComposeFile = path.join(
  __dirname,
  `../docker/compose-database.yml`
);

spawn("docker-compose", ["-f", dockerComposeFile, "up", "-d", "mysql_db"]);

console.log(boxen(setupConfig.introMessage, boxenConfig));
setup();
