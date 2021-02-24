const { spawn } = require("child_process");

const installDependencies = spawn("npm", ["install"], {
  stdio: [process.stdin, process.stdout, process.stderr],
});

installDependencies.on("close", (code) => {
  const startDevelopment = spawn("npm", ["start"], {
    stdio: [process.stdin, process.stdout, process.stderr],
  });

  startDevelopment.on("close", (code) => {
    console.log("Development server exited with code", code);
  });
});
