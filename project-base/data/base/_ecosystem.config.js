module.exports = {
  apps: [
    {
      name: "service-000-mysql",
      cwd: "./service-000-mysql",
      script: "start-development.js",
      watch: false,
    },
    {
      name: "service-000-storybook",
      cwd: "./service-000-storybook",
      script: "start-development.js",
      watch: false,
      env: {{service: storybook}},
    },
    {
      name: "service-001-gatsby",
      cwd: "./service-001-gatsby",
      script: "start-development.js",
      watch: false,
      env: {{service: gatsby}},
    },
    {
      name: "service-002-strapi",
      cwd: "./service-002-strapi",
      script: "start-development.js",
      watch: false,
      env: {{service: strapi}},
    },
    {
      name: "service-003-ionic",
      cwd: "./service-003-ionic",
      script: "start-development.js",
      watch: false,
      env: {{service: ionic}},
    },
  ],
};
