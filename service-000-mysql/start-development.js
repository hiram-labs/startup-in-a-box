const { spawn } = require("child_process");
const path = require("path");
const [, , flag] = process.argv;

let attempts = 0;
const numAttempts = 5;
const timeout = 1000;
const dockerComposeFile = path.join(
  __dirname,
  "../project-base/docker/development/compose-mysql.yml"
);

const installDependencies = spawn("yarn", [`install:mysql:dependencies`], {
  stdio: [process.stdin, process.stdout, process.stderr],
});

installDependencies.on("close", (code) => {
  const mysqlContainer = spawn(
    "docker-compose",
    [`-f`, dockerComposeFile, `up`, `-d`],
    {
      stdio: [process.stdin, process.stdout, process.stderr],
    }
  );

  mysqlContainer.on("close", (code) => {
    flag === "--shell" && startShell();
  });
});

const startShell = () => {
  const checkContainerStatus = spawn("docker", [
    `inspect`,
    `--format`,
    `'{{json .State.Running}}'`,
    `mysql_db`,
  ]);
  checkContainerStatus.stdout.on("data", (data) => {
    isContainerRunning = `${data}`.trim() === "'true'";
    if (isContainerRunning) {
      // start the shell once container is available
      console.log("🚀 Starting shell!");
      const containerShell = spawn(
        "docker",
        [`exec`, `-it`, `mysql_db`, `/bin/bash`, `--login`],
        {
          stdio: [process.stdin, process.stdout, process.stderr],
        }
      );
      containerShell.on("close", (code) => {
        console.log(
          `🛑 Shell exited with code: ${code}\n\n🏗️ Taking down containers ...`
        );
        spawn("yarn", [`stop:mysql:container`]);
      });
    } else if (attempts < numAttempts) {
      // recursively check for availability of container
      attempts++;
      console.log("⌛ Waiting for the Container!");
      setTimeout(() => {
        startShell();
      }, timeout);
    }
  });
};
