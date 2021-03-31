const { spawn } = require("child_process");
const path = require("path");

const dockerComposeFile = path.join(
  __dirname,
  "../project-base/docker/compose-selenium.yml"
);

const installDependencies = spawn("yarn", [`install:selenium:dependencies`], {
  stdio: [process.stdin, process.stdout, process.stderr],
});

installDependencies.on("close", (code) => {
  const seleniumContainer = spawn(
    "docker-compose",
    [`-f`, dockerComposeFile, `up`, `--remove-orphans`],
    {
      stdio: [process.stdin, process.stdout, process.stderr],
    }
  );

  seleniumContainer.on("close", (code) => {
    console.log("Development server exited with code", code);
  });
});
