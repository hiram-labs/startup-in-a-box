const ora = require("ora");
const { progressFinishing, removeServicesDependencies } = require("../utils");

const resetBase = require("./lib/base");
const resetEnv = require("./lib/env");
const resetGatsby = require("./lib/gatsby");
const resetGcloud = require("./lib/gcloud");
const resetIonic = require("./lib/ionic");
const resetSelenium = require("./lib/selenium");
const resetStorybook = require("./lib/storybook");
const resetStrapi = require("./lib/strapi");
const resetMysql = require("./lib/mysql");

module.exports = async (serviceName, answers) => {
  const spinner = ora(progressFinishing()).start();

  const isResetBase = serviceName === "base";
  const isResetEnv = serviceName === "env";
  const isResetGatsby = serviceName === "gatsby";
  const isResetGcloud = serviceName === "gcloud";
  const isResetIonic = serviceName === "ionic";
  const isResetSelenium = serviceName === "selenium";
  const isResetStorybook = serviceName === "storybook";
  const isResetStrapi = serviceName === "strapi";
  const isResetMysql = serviceName === "mysql";

  if (serviceName) {
    isResetBase && (await resetBase(answers));
    isResetEnv && (await resetEnv(answers));
    isResetGatsby && (await resetGatsby(answers));
    isResetGcloud && (await resetGcloud(answers));
    isResetIonic && (await resetIonic(answers));
    isResetSelenium && (await resetSelenium(answers));
    isResetStorybook && (await resetStorybook(answers));
    isResetStrapi && (await resetStrapi(answers));
    isResetMysql && (await resetMysql(answers));
    return;
  }

  await resetBase(answers);
  await resetEnv(answers);
  await resetGatsby(answers);
  await resetGcloud(answers);
  await resetIonic(answers);
  await resetSelenium(answers);
  await resetStorybook(answers);
  await resetStrapi(answers);
  await resetMysql(answers);

  removeServicesDependencies();
  spinner.stop();
};
