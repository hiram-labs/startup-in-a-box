const { spawn } = require("child_process");

const setup = spawn("cross-env", ["INITIAL_SETUP=true", "yarn", "develop"]);

setup.stdout.on("data", (data) => {
  console.log(`stdout: ${data}`);
});

setup.stderr.on("data", (data) => {
  console.log(`stderr: ${data}`);
});

setup.on("exit", (code) => {
  if (code === 0) {
    const syncDB = spawn("yarn", ["sync-db"]);

    syncDB.stdout.on("data", (data) => {
      console.log(`stdout: ${data}`);
    });

    syncDB.stderr.on("data", (data) => {
      console.log(`stderr: ${data}`);
    });
  }
});
