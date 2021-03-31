"use strict";

const path = require("path");
const { spawn } = require("child_process");

const { setup } = require("../wizard");
const { setupConfig } = require("../data/base/wizard.config");

const [, , serviceName] = process.argv;

// starts mysql db ie strapi depends on this
const dockerComposeFile = path.join(
  __dirname,
  `../docker/compose-database.yml`
);

spawn("docker-compose", ["-f", dockerComposeFile, "up", "-d", "mysql_db"]);

console.log(setupConfig.introMessage);
setup(serviceName);
