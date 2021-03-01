"use strict";

const path = require("path");
const { spawn, exec } = require("child_process");

const boxen = require("boxen");

const setup = require("./project_base/setup-handlers//inquirer");
const reset = require("./project_base/reset-handlers");

const root = process.cwd();

const {
  setupConfig,
  resetConfig,
} = require("./project_base/data/inquirer-config");
const [, , resetFlag, service] = process.argv;
const flagged = resetFlag === "-r";

const boxenConfig = {
  padding: 1,
};

const dockerComposeFile = path.join(
  root,
  `./project_base/docker-handlers/compose-database.yml`
);

(async () => {
  if (flagged) {
    console.log(boxen(resetConfig.introMessage, boxenConfig));
    await reset(service);
    return;
  }

  spawn("docker-compose", ["-f", dockerComposeFile, "up", "-d", "mysql_db"]);

  console.log(boxen(setupConfig.introMessage, boxenConfig));
  await setup();

  // exec(`docker-compose -f ${dockerComposeFile} stop`);
})();
