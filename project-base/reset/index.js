const fs = require("fs");
const path = require("path");
const ora = require("ora");
const rimraf = require("rimraf");
const { progressFinishing } = require("../data/base/progress-config");

const root = process.cwd();

const removeDependencies = (service) => {
  rimraf(path.join(root, `./${service}/node_modules`), () => {
    console.log(`${service} node_modules reset successful`);
  });
  rimraf(path.join(root, `./${service}/yarn.lock`), () => {
    console.log(`${service} yarn.lock reset successful`);
  });
  rimraf(path.join(root, `./${service}/package-lock.json`), () => {
    console.log(`${service} package-lock.json reset successful`);
  });
};

const resetStorybook = async () => {
  const targetFiles = ["package.json"];
  targetFiles.forEach((file) => {
    fs.copyFile(
      path.join(__dirname, `../data/storybook/_${file}`),
      path.join(root, `./service-000-storybook/${file}`),
      (err) => {
        if (err) throw err;
      }
    );
  });
  removeDependencies("service-000-storybook");
};

const resetGatsby = async () => {
  const targetFiles = ["package.json"];
  targetFiles.forEach((file) => {
    fs.copyFile(
      path.join(__dirname, `../data/gatsby/_${file}`),
      path.join(root, `./service-001-gatsby/${file}`),
      (err) => {
        if (err) throw err;
      }
    );
  });
  removeDependencies("service-001-gatsby");
};

const resetStrapi = async () => {
  const targetFiles = ["package.json"];
  targetFiles.forEach((file) => {
    fs.copyFile(
      path.join(__dirname, `../data/strapi/_${file}`),
      path.join(root, `./service-002-strapi/${file}`),
      (err) => {
        if (err) throw err;
      }
    );
  });
  removeDependencies("service-002-strapi");
};

const resetIonic = async () => {
  const targetFiles = ["package.json"];
  targetFiles.forEach((file) => {
    fs.copyFile(
      path.join(__dirname, `../data/ionic/_${file}`),
      path.join(root, `./service-003-ionic/${file}`),
      (err) => {
        if (err) throw err;
      }
    );
  });
  removeDependencies("service-003-ionic");
};

const resetMysql = async () => {
  const targetFiles = ["init.sql"];
  targetFiles.forEach((file) => {
    fs.copyFile(
      path.join(__dirname, `../data/mysql/_${file}`),
      path.join(root, `./service-000-mysql/backup/${file}`),
      (err) => {
        if (err) throw err;
      }
    );
  });
  removeDependencies("service-000-mysql");
};

const resetGcloud = async () => {
  const targetFiles = ["env.sh"];
  targetFiles.forEach((file) => {
    fs.copyFile(
      path.join(__dirname, `../data/gcloud/_${file}`),
      path.join(root, `./service-000-gcloud/scripts/shell/chalk/lib/${file}`),
      (err) => {
        if (err) throw err;
      }
    );
  });
  removeDependencies("service-000-gcloud");
};

module.exports = async (service) => {
  const isResetStorybook = service === "storybook";
  const isResetGatsby = service === "gatsby";
  const isResetStrapi = service === "strapi";
  const isResetIonic = service === "ionic";
  const isResetMysql = service === "mysql";
  const isResetGcloud = service === "gcloud";

  if (service) {
    isResetStorybook && (await resetStorybook());
    isResetGatsby && (await resetGatsby());
    isResetStrapi && (await resetStrapi());
    isResetIonic && (await resetIonic());
    isResetMysql && (await resetMysql());
    isResetGcloud && (await resetGcloud());
    return;
  }
  const spinner = ora(progressFinishing());
  spinner.start();

  await resetStorybook();
  await resetGatsby();
  await resetStrapi();
  await resetIonic();
  await resetMysql();
  await resetGcloud();

  spinner.stop();
};
