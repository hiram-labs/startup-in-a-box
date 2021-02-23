const { spawn } = require("child_process");

const elected = process.env.START_SERVICES;

const service = {
  mysql: "mysql_db",
  adminer: "adminer",
  gatsby: "service_001_gatsby",
  strapi: "service_002_strapi",
  ionic: "service_003_ionic",
  db_development: "mysql_db adminer",
  frontend_development: "mysql_db service_002_strapi service_003_ionic",
  production:
    "mysql_db adminer service_001_gatsby service_002_strapi service_003_ionic",
};

const child = spawn("docker-compose", ["up", service[elected]]);

child.on("error", function () {
  console.log("child process killed with error");
});

child.stderr.on("data", (data) => {
  console.error(`child stderr:\n${data}`);
});

child.stdout.on("data", (data) => {
  console.log(`child stdout:\n${data}`);
});

child.on("exit", function (code, signal) {
  console.log(
    "Development server exited " + `code ${code} and signal ${signal}`
  );
});
