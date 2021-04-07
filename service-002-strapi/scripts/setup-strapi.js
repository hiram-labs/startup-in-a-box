const { spawn } = require("child_process");

const syncDB_ = spawn("yarn", ["sync-db"], {
  stdio: [process.stdin, process.stdout, process.stderr],
});

syncDB_.on("close", (code) => {
  if (code === 0) {
    const setup = spawn(
      "cross-env",
      ["INITIAL_SETUP=true", "yarn", "develop"],
      { stdio: [process.stdin, process.stdout, process.stderr] }
    );
  }
});
