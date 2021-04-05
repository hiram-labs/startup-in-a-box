const { spawn } = require("child_process");
const path = require("path");

const dockerComposeFile = path.join(
  __dirname,
  "../project-base/docker/compose-database.yml"
);
const localVolume = path.join(__dirname, "../service-000-mysql/src");

const installDependencies = spawn("yarn", [`install:mysql:dependencies`], {
  stdio: [process.stdin, process.stdout, process.stderr],
});

installDependencies.on("close", (code) => {
  const mysqlContainer = spawn(
    "docker-compose",
    // [`-f`, dockerComposeFile, `up`, `-d`],
    [
      `-f`,
      dockerComposeFile,
      `run`,
      `--rm`,
      `--name`,
      `mysql_db`,
      `--volume`,
      `${localVolume}:/usr/src/service-000-mysql/src`,
      `mysql_db`,
      `sh`,
      `-c`,
      `chalk`,
    ],
    {
      stdio: [process.stdin, process.stdout, process.stderr],
    }
  );

  mysqlContainer.on("close", (code) => {
    console.log("Development server exited with code", code);
  });
});
