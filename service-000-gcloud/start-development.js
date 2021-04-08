const { spawn } = require("child_process");
const path = require("path");
const [, , flag] = process.argv;

const dockerComposeFile = path.join(
  __dirname,
  "../project-base/docker/development/compose-gcloud.yml"
);

const installDependencies = spawn("yarn", [`install:gcloud:dependencies`], {
  stdio: [process.stdin, process.stdout, process.stderr],
});

installDependencies.on("close", (code) => {
  const gcloudContainer = spawn(
    "docker-compose",
    [`-f`, dockerComposeFile, `up`, `-d`],
    {
      stdio: [process.stdin, process.stdout, process.stderr],
    }
  );

  gcloudContainer.on("close", (code) => {
    flag === "--shell" && startShell();
  });
});

const startShell = () => {
  let attempts = 0;
  const numAttempts = 5;
  const timeout = 1000;

  const checkContainerStatus = spawn("docker", [
    `inspect`,
    `--format`,
    `'{{json .State.Running}}'`,
    `gcloud`,
  ]);
  checkContainerStatus.stdout.on("data", (data) => {
    isContainerRunning = `${data}`.trim() === "'true'";
    if (isContainerRunning) {
      // start the shell once container is available
      console.log("🚀 Starting shell!");
      const containerShell = spawn(
        "docker",
        [`exec`, `-it`, `gcloud`, `/bin/bash`, `--login`],
        {
          stdio: [process.stdin, process.stdout, process.stderr],
        }
      );
      containerShell.on("close", (code) => {
        console.log(
          `🛑 Shell exited with code: ${code}\n\n🏗️ Taking down containers ...`
        );
        spawn("yarn", [`stop:gcloud:container`]);
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
