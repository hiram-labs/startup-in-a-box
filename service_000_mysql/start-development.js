const { spawn } = require("child_process");
const path = require("path");

const dockerComposeFile = path.join(__dirname, "../compose-database.yml");
const mysqlContainer = spawn(
  "docker-compose",
  ["-f", dockerComposeFile, "up"],
  {
    stdio: [process.stdin, process.stdout, process.stderr],
  }
);

mysqlContainer.on("close", (code) => {
  console.log("Development server exited with code", code);
});
