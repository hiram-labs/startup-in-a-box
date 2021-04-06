const { spawn } = require("child_process");
const path = require("path");

let isComposeUpComplete = false;
let startShellAttempts = 0;
const [, , flag] = process.argv;

const dockerComposeFile = path.join(
  __dirname,
  "../project-base/docker/compose-database.yml"
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
    console.log("Development server exited with code", code);
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
    const isContainerRunning = `${data}`.trim() === "'true'";
    if (isContainerRunning && isComposeUpComplete && startShellAttempts < 15) {
      // start the shell once container is available
      console.log("🚀 Starting shell!");
      const containerShell = spawn(
        "docker",
        [`exec`, `-it`, `mysql_db`, `sh`],
        {
          stdio: [process.stdin, process.stdout, process.stderr],
        }
      );
      containerShell.on("close", (code) => {
        console.log("Shell exited with code", code);
      });
    } else {
      // recursively check for availability of container
      console.log("⌛ Waiting for the Container!");
      startShellAttempts++;
      setTimeout(() => {
        startShell();
      }, 5000);
    }
  });
};
flag === "--shell" && startShell();
