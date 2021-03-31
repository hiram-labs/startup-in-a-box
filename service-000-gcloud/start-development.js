const { spawn } = require("child_process");
const path = require("path");

const dockerComposeFile = path.join(
  __dirname,
  "../project-base/docker/compose-gcloud.yml"
);

const localVolume = path.join(__dirname, "../service-000-gcloud/src");

const installDependencies = spawn("yarn", [`install:gcloud:dependencies`], {
  stdio: [process.stdin, process.stdout, process.stderr],
});

installDependencies.on("close", (code) => {
  const gcloudContainer = spawn(
    "docker-compose",
    [
      `-f`,
      dockerComposeFile,
      `run`,
      `--rm`,
      `--name`,
      `gcloud`,
      `--volume`,
      `${localVolume}:/usr/src/service-000-gcloud`,
      `gcloud`,
      `sh`,
    ],
    {
      stdio: [process.stdin, process.stdout, process.stderr],
    }
  );

  gcloudContainer.on("close", (code) => {
    console.log("Development server exited with code", code);
  });
});
