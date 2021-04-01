const { spawn } = require("child_process");
const path = require("path");

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
    [`-f`, dockerComposeFile, `up`],
    {
      stdio: [process.stdin, process.stdout, process.stderr],
    }
  );

  mysqlContainer.on("close", (code) => {
    console.log("Development server exited with code", code);
  });
});
