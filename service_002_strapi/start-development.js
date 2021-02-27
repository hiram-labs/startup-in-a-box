#!/usr/bin/env node

const { spawn } = require("child_process");

const installDependencies = spawn("yarn", ["install"], {
  stdio: [process.stdin, process.stdout, process.stderr],
});

installDependencies.on("close", (code) => {
  const startDevelopment = spawn("yarn", ["develop"], {
    stdio: [process.stdin, process.stdout, process.stderr],
  });

  startDevelopment.on("close", (code) => {
    console.log("Development server exited with code", code);
  });
});
