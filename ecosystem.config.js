module.exports = {
  apps: [
    {
      name: "service_000_mysql",
      cwd: "./service_000_mysql",
      script: "start-development.js",
      watch: false,
    },
    {
      name: "service_001_gatsby",
      cwd: "./service_001_gatsby",
      script: "start-development.js",
      watch: false,
    },
    {
      name: "service_002_strapi",
      cwd: "./service_002_strapi",
      script: "start-development.js",
      watch: false,
    },
    {
      name: "service_003_ionic",
      cwd: "./service_003_ionic",
      script: "start-development.js",
      watch: false,
    },
  ],
};
