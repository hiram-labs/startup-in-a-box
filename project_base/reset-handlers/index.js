const fs = require("fs");
const path = require("path");

const root = process.cwd();

const resetStorybook = async () => {
  const targetFiles = ["package.json"];
  targetFiles.forEach((file) => {
    fs.copyFile(
      path.join(__dirname, `../data/storybook/_${file}`),
      path.join(root, `./service_000_storybook/${file}`),
      (err) => {
        if (err) throw err;
      }
    );
  });
};

const resetGatsby = async () => {
  const targetFiles = ["package.json"];
  targetFiles.forEach((file) => {
    fs.copyFile(
      path.join(__dirname, `../data/gatsby/_${file}`),
      path.join(root, `./service_001_gatsby/${file}`),
      (err) => {
        if (err) throw err;
      }
    );
  });
};

const resetStrapi = async () => {
  const targetFiles = ["package.json"];
  targetFiles.forEach((file) => {
    fs.copyFile(
      path.join(__dirname, `../data/strapi/_${file}`),
      path.join(root, `./service_002_strapi/${file}`),
      (err) => {
        if (err) throw err;
      }
    );
  });
};

const resetIonic = async () => {
  const targetFiles = ["package.json"];
  targetFiles.forEach((file) => {
    fs.copyFile(
      path.join(__dirname, `../data/ionic/_${file}`),
      path.join(root, `./service_003_ionic/${file}`),
      (err) => {
        if (err) throw err;
      }
    );
  });
};

const resetMysql = async () => {
  const targetFiles = ["init.sql"];
  targetFiles.forEach((file) => {
    fs.copyFile(
      path.join(__dirname, `../data/mysql/_${file}`),
      path.join(root, `./service_000_mysql/backup/${file}`),
      (err) => {
        if (err) throw err;
      }
    );
  });
};

module.exports = async (service) => {
  const isResetStorybook = service === "storybook";
  const isResetGatsby = service === "gatsby";
  const isResetStrapi = service === "strapi";
  const isResetIonic = service === "ionic";
  const isResetMysql = service === "mysql";

  if (service) {
    isResetStorybook && (await resetStorybook());
    isResetGatsby && (await resetGatsby());
    isResetStrapi && (await resetStrapi());
    isResetIonic && (await resetIonic());
    isResetMysql && (await resetMysql());
    return;
  }

  await resetStorybook();
  await resetGatsby();
  await resetStrapi();
  await resetIonic();
  await resetMysql();
};
