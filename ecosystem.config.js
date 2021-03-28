module.exports = {
  apps: [
    {
      name: "service_000_mysql",
      cwd: "./service_000_mysql",
      script: "start-development.js",
      watch: false,
    },
    {
      name: "service_000_storybook",
      cwd: "./service_000_storybook",
      script: "start-development.js",
      watch: false,
      env: {NODE_ENV:"development"},
    },
    {
      name: "service_001_gatsby",
      cwd: "./service_001_gatsby",
      script: "start-development.js",
      watch: false,
      env: {NODE_ENV:"development"},
    },
    {
      name: "service_002_strapi",
      cwd: "./service_002_strapi",
      script: "start-development.js",
      watch: false,
      env: {NODE_ENV:"development",
HOST:"0.0.0.0",
PORT:"1337",
DATABASE_HOST:"127.0.0.1",
DATABASE_PORT:"3308",
DATABASE_NAME:"mysql_db",
DATABASE_USERNAME:"root",
DATABASE_PASSWORD:"root",
CMS_ADMIN_USER:"da_package",
CMS_ADMIN_EMAIL:"admin@dapackage.com",
CMS_ADMIN_PASSWORD:"Root_admin_123",
JWT_SECRET:"6302e01a-6044-4239-a32f-8a4728cd622a"},
    },
    {
      name: "service_003_ionic",
      cwd: "./service_003_ionic",
      script: "start-development.js",
      watch: false,
      env: {NODE_ENV:"development"},
    },
  ],
};
