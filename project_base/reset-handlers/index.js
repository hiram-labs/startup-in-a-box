const fs = require("fs");
const path = require("path");

const root = process.cwd();

const resetGatsby = async () => {
  const targetFiles = ["gatsby-config.js", "package.json"];
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

const resetStrapi = async () => {};

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

module.exports = async (service) => {
  const isResetGatsby = service === "gatsby";
  const isResetStrapi = service === "strapi";
  const isResetIonic = service === "ionic";

  if (service) {
    isResetGatsby && (await resetGatsby());
    isResetStrapi && (await resetStrapi());
    isResetIonic && (await resetIonic());
    return;
  }

  await resetGatsby();
  await resetStrapi();
  await resetIonic();
};
