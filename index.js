"use strict";

const inquirer = require("inquirer");
const util = require("util");
const exec = util.promisify(require("child_process").exec);
const boxen = require("boxen");
const setup = require("./project_base/setup-handlers//inquirer");
const reset = require("./project_base/reset-handlers");

const {
  setupConfig,
  resetConfig,
} = require("./project_base/data/inquirer-config");
const [, , resetFlag, service] = process.argv;
const flagged = resetFlag === "-r";

const boxenConfig = {
  padding: 1,
};

const initDBScriptPath = path.join(
  root,
  `./service_000_mysql/start-development.js`
);

const composeDBpath = path.join(
  root,
  `./project_base/docker-handlers/compose-database.yml`
);

module.exports = async () => {
  if (flagged) {
    console.log(boxen(resetConfig.introMessage, boxenConfig));
    await reset(service);
    return;
  }

  console.log(boxen(setupConfig.introMessage, boxenConfig));
  const { stdout, stderr } = await exec(`node ${initDBScriptPath}`);
  if (stderr) {
    throw stderr;
  }
  console.log(`stdout: ${stdout}`);
  await setup();

  const { stdout, stderr } = await exec(
    `docker-compose -f ${composeDBpath} stop`
  );
  if (stderr) {
    throw stderr;
  }
  console.log(`stdout: ${stdout}`);
};
