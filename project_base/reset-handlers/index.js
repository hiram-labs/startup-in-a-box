const fs = require("fs");
const path = require("path");

const root = process.cwd();

const resetGatsby = async () => {
  const targetFiles = ["gatsby-config.js", "package.json"];
  targetFiles.forEach((file) => {
    fs.copyFile(
      path.join(__dirname, `../data/backup-${file}`),
      path.join(root, `./service_001_gatsby/${file}`),
      (err) => {
        if (err) throw err;
      }
    );
  });
};

const resetStrapi = async () => {};

const resetIonic = async () => {};

module.exports = async (service) => {
  const isResetGatsby = service === "gatsby";
  const isResetStrapi = service === "strapi";
  const isResetIonic = service === "ionic";

  isResetGatsby && (await resetGatsby());
  isResetStrapi && (await resetStrapi());
  isResetIonic && (await resetIonic());

  if (!service) {
    await resetGatsby();
    await resetStrapi();
    await resetIonic();
  }
};
