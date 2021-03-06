const { spawn } = require("child_process");

const syncDB_ = spawn("yarn", ["sync-db"]);

syncDB_.stdout.on("data", (data) => {
  console.log(`stdout: ${data}`);
});

syncDB_.stderr.on("data", (data) => {
  console.log(`stderr: ${data}`);
});

syncDB_.on("close", (code) => {
  if (code === 0) {
    const setup = spawn("cross-env", ["INITIAL_SETUP=true", "yarn", "develop"]);

    setup.stdout.on("data", (data) => {
      console.log(`stdout: ${data}`);
    });

    setup.stderr.on("data", (data) => {
      console.log(`stderr: ${data}`);
    });
  }
});
