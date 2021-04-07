const { spawn } = require("child_process");
const path = require("path");

let isComposeUpComplete = false;
let isContainerRunning = false;
let startShellAttempts = 0;
let numAttempts = 25;
let timeout = 10000;
const [, , flag] = process.argv;

const dockerComposeFile = path.join(
  __dirname,
  "../project-base/docker/development/compose-database.yml"
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
    isComposeUpComplete = true;
    console.log("🛑 Development server exited with code", code);
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
    if (
      isContainerRunning &&
      isComposeUpComplete &&
      startShellAttempts < numAttempts
    ) {
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
        spawn("yarn", [`stop:database:container`]);
      });
    } else if (startShellAttempts < numAttempts) {
      // recursively check for availability of container
      console.log("⌛ Waiting for the Container!");
      startShellAttempts++;
      setTimeout(() => {
        startShell();
      }, timeout);
    }
  });
};
flag === "--shell" && startShell();
