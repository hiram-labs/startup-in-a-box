"use strict";

const { spawn } = require("child_process");

const { setup } = require("../wizard");
const { setupConfig } = require("../data/base/wizard.config");

const [, , serviceName] = process.argv;

// initialise mysql_db
if (serviceName === "strapi" || undefined) {
  const subprocess = spawn("yarn", [`start:mysql:container`], {
    detached: true,
    stdio: "ignore",
  });
  subprocess.unref();
}

console.log(setupConfig.introMessage);
setup(serviceName);
