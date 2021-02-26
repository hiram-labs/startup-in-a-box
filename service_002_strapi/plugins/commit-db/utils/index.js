"use strict";

/**
 *
 * Utility helpers for the plugin
 *
 */

const startNextProcess = "PROCEED-TO-NEXT-PROCESS-WITH-WARNING";

module.exports = {
  startNextProcess: startNextProcess,
  killProcess: (message = "CODE-000-EXIT") => {
    console.log(`${startNextProcess} ${message}`);
    process.kill(process.pid, "SIGTERM");
  },
};
