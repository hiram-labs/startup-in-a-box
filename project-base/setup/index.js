const ora = require("ora");
const { progressFinishing } = require("../utils");

const setupBase = require("./lib/base");
const setupEnv = require("./lib/env");
const setupGatsby = require("./lib/gatsby");
const setupGcloud = require("./lib/gcloud");
const setupIonic = require("./lib/ionic");
const setupSelenium = require("./lib/selenium");
const setupStorybook = require("./lib/storybook");
const setupStrapi = require("./lib/strapi");
const setupMysql = require("./lib/mysql");

module.exports = async (serviceName, answers) => {
  const spinner = ora(progressFinishing()).start();

  const isSetupBase = serviceName === "base";
  const isSetupEnv = serviceName === "env";
  const isSetupGatsby = serviceName === "gatsby";
  const isSetupGcloud = serviceName === "gcloud";
  const isSetupIonic = serviceName === "ionic";
  const isSetupSelenium = serviceName === "selenium";
  const isSetupStorybook = serviceName === "storybook";
  const isSetupStrapi = serviceName === "strapi";
  const isSetupMysql = serviceName === "mysql";

  if (serviceName) {
    isSetupBase && (await setupBase(answers));
    isSetupEnv && (await setupEnv(answers));
    isSetupGatsby && (await setupGatsby(answers));
    isSetupGcloud && (await setupGcloud(answers));
    isSetupIonic && (await setupIonic(answers));
    isSetupSelenium && (await setupSelenium(answers));
    isSetupStorybook && (await setupStorybook(answers));
    isSetupStrapi && (await setupStrapi(answers));
    isSetupMysql && (await setupMysql(answers));
    return;
  }

  await setupBase(answers);
  await setupEnv(answers);
  await setupGatsby(answers);
  await setupGcloud(answers);
  await setupIonic(answers);
  await setupSelenium(answers);
  await setupStorybook(answers);
  await setupStrapi(answers);
  await setupMysql(answers);

  spinner.stop();
};
