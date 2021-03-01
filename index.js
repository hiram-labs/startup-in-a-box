"use strict";

const path = require("path");
const util = require("util");

const inquirer = require("inquirer");
const boxen = require("boxen");

const setup = require("./project_base/setup-handlers//inquirer");
const reset = require("./project_base/reset-handlers");

const exec = util.promisify(require("child_process").exec);
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

const initDBScriptPath = path.join(
  root,
  `./service_000_mysql/start-development.js`
);

const composeDBpath = path.join(
  root,
  `./project_base/docker-handlers/compose-database.yml`
);

(async () => {
  if (flagged) {
    console.log(boxen(resetConfig.introMessage, boxenConfig));
    await reset(service);
    return;
  }

  console.log(boxen(setupConfig.introMessage, boxenConfig));
  const { stdout: initDBStdout, stderr: initDBStderr } = await exec(
    `node ${initDBScriptPath}`
  );
  if (initDBStderr) {
    throw stderr;
  }
  console.log(`stdout: ${initDBStdout}`);
  await setup();

  const { stdout: killDBStdout, stderr: killDBStderr } = await exec(
    `docker-compose -f ${composeDBpath} stop`
  );
  if (killDBStderr) {
    throw stderr;
  }
  console.log(`stdout: ${killDBStdout}`);
})();
