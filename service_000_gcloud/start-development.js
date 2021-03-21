const { spawn } = require("child_process");
const path = require("path");

const dockerComposeFile = path.join(
  __dirname,
  "../project_base/docker-handlers/compose-gcloud.yml"
);

const localVolume = path.join(__dirname, "../service_000_gcloud");
const entryVolume = path.join(__dirname, "../service_000_gcloud/main");

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
    `${localVolume}:/usr/src/service_000_gcloud`,
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
