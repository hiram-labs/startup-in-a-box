const { spawn } = require("child_process");
const { startNextProcess } = require("../plugins/commit-db/utils");

function _void() {
  return;
}

function startSetup(callBack = _void) {
  const setup = spawn("cross-env", [
    "INITIAL_SETUP=true",
    "yarn",
    "initial-run",
  ]);

  let trigger = false;

  setup.stdout.on("data", (data) => {
    console.log(`stdout: ${data}`);

    if (data.includes(startNextProcess)) {
      trigger = true;
    }
  });

  setup.stderr.on("data", (data) => {
    console.error(`stderr: ${data}`);
  });

  setup.on("exit", () => {
    trigger && callBack();
  });
}

function startSyncDB(callBack = _void) {
  const syncDB = spawn("yarn", ["sync-db"]);

  let trigger = false;

  syncDB.stdout.on("data", (data) => {
    console.log(`stdout: ${data}`);

    if (data.includes(startNextProcess)) {
      trigger = true;
    }
  });

  syncDB.stderr.on("data", (data) => {
    console.error(`stderr: ${data}`);
  });

  syncDB.on("exit", () => {
    trigger && callBack();
  });
}

function init() {
  startSyncDB(startSetup);
  // startSetup(startSyncDB); //use in dev to flush db
}

init();
