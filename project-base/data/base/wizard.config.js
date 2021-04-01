"use strict";

const boxen = require("boxen");
const boxenConfig = {
  padding: 1,
};

module.exports = {
  setupConfig: {
    introMessage: boxen(
      "Welcome to Chalk.\n\n   Please provide values as required to setup your new project.\n   Thanks for using this boilerplate.\n\n   Brought to you by:\n   Owusu K <adjeibohyen@hotmail.co.uk>",
      boxenConfig
    ),
  },
  resetConfig: {
    introMessage: boxen(
      "Thanks for choosing Chalk.\n\n   Brought to you by:\n   Owusu K <adjeibohyen@hotmail.co.uk>",
      boxenConfig
    ),

    confirmReset: {
      field: "confirmReset",
      prompt: "This action will reset to factory see docs. [y/N]",
    },
  },

  organisation: {
    companyName: {
      field: "companyName",
      prompt: "Project or company name",
      placeholder: "My Startup",
    },
    companyDescription: {
      field: "companyDescription",
      prompt: "Project or company description",
      placeholder: "A cool startup company!",
    },
    companyUrl: {
      field: "companyUrl",
      prompt: "Project or company URL in this format",
      placeholder: "example.com",
    },
    maintainerName: {
      field: "maintainerName",
      prompt: "Maintainer name",
      placeholder: "Jo Blog",
    },
    maintainerEmail: {
      field: "maintainerEmail",
      prompt: "Maintainer email",
      placeholder: "jo.blog@email.com",
    },
  },

  analytics: {
    gtagEnable: {
      field: "gtagEnable",
      prompt: "Enable Google analytics [y/N]",
    },
    gtagID: {
      field: "gtagID",
      prompt: "Google Analytics ID",
      placeholder: "G-xxxxxx",
    },
  },
};
