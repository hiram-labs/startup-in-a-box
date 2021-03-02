"use strict";

const path = require("path");
const { spawn, exec } = require("child_process");
const boxen = require("boxen");
const setup = require("../setup-handlers/inquirer");
const { setupConfig } = require("../data/base/inquirer-config");
const root = process.cwd();

const boxenConfig = {
  padding: 1,
};

const dockerComposeFile = path.join(
  root,
  `../docker-handlers/compose-database.yml`
);

spawn("docker-compose", ["-f", dockerComposeFile, "up", "-d", "mysql_db"]);

console.log(boxen(setupConfig.introMessage, boxenConfig));
setup();
