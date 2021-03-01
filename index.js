"use strict";

const path = require("path");
const util = require("util");
const { exec: execImport, spawn } = require("child_process");

const boxen = require("boxen");

const setup = require("./project_base/setup-handlers//inquirer");
const reset = require("./project_base/reset-handlers");

const exec = util.promisify(execImport);
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

  const mysqlContainer = spawn(
    "docker-compose",
    ["-f", dockerComposeFile, "up"],
    {
      stdio: [process.stdin, process.stdout, process.stderr],
    }
  );
  mysqlContainer.on("close", (code) => {
    console.log("DB server exited with code", code);
  });

  console.log(boxen(setupConfig.introMessage, boxenConfig));
  await setup();

  const { stdout, stderr } = await exec(
    `docker-compose -f ${dockerComposeFile} stop`
  );
  if (stderr) {
    throw stderr;
  }
  console.log(`stdout: ${stdout}`);
})();
