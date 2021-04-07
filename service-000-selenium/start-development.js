const { spawn } = require("child_process");
const path = require("path");

const seleniumComposeFile = path.join(
  __dirname,
  "../project-base/docker/development/compose-selenium.yml"
);

const workerLocalVolume = path.join(__dirname, "../service-000-selenium/src");

const installDependencies = spawn("yarn", [`install:selenium:dependencies`], {
  stdio: [process.stdin, process.stdout, process.stderr],
});

installDependencies.on("close", (code) => {
  const seleniumContainer = spawn(
    "docker-compose",
    [
      `-f`,
      seleniumComposeFile,
      `--profile`,
      `grid`,
      `up`,
      `--remove-orphans`,
      `-d`,
    ],
    {
      stdio: [process.stdin, process.stdout, process.stderr],
    }
  );

  seleniumContainer.on("close", (code) => {
    const workerContainer = spawn(
      "docker-compose",
      [
        `-f`,
        seleniumComposeFile,
        `run`,
        `--rm`,
        `--name`,
        `selenium-worker`,
        `--volume`,
        `${workerLocalVolume}:/usr/src/selenium/src`,
        `selenium-worker`,
        `sh`,
        `-c`,
        `chalk`,
      ],
      {
        stdio: [process.stdin, process.stdout, process.stderr],
      }
    );

    workerContainer.on("close", (code) => {
      console.log("Development server exited with code", code);
    });
  });
});
