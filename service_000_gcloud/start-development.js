const { spawn } = require("child_process");
const path = require("path");

const dockerComposeFile = path.join(
  __dirname,
  "../project_base/docker-handlers/compose-gcloud.yml"
);

const gcloudContainer = spawn(
  "docker-compose",
  ["-f", dockerComposeFile, "run", "gcloud", "sh"],
  {
    stdio: [process.stdin, process.stdout, process.stderr],
  }
);

gcloudContainer.on("close", (code) => {
  console.log("Development server exited with code", code);
});

// "start-gcloud": "docker-compose -f ./project_base/docker-handlers/compose-gcloud.yml run gcloud sh",
