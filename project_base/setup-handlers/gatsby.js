const fs = require("fs");
const path = require("path");

module.exports = function (answers) {
  const { companyName, maintainerName, maintainerEmail } = answers;

  console.log(companyName, maintainerName, maintainerEmail);
};
