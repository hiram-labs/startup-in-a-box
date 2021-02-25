/*
 *
 * HomePage
 *
 */

import React, { memo } from "react";
// import PropTypes from 'prop-types';
import pluginId from "../../pluginId";
import axios from "axios";

const handleCommitDB = () => {
  strapi.lockApp();
  axios
    .get(`${strapi.backendURL}/${pluginId}`)
    .then(() =>
      strapi.notification.toggle({
        type: "success",
        message: { id: "app.notification.success", defaultMessage: "Done!" },
      })
    )
    .catch(() =>
      strapi.notification.toggle({
        type: "warning",
        message: { id: "app.notification.warning", defaultMessage: "Error!" },
      })
    )
    .then(() => strapi.unlockApp());
};

const HomePage = () => {
  return (
    <div className="d-flex justify-content-center align-items-center">
      <div className="my-5">
        <button
          type="button"
          className="p-2 btn btn-outline-primary"
          onClick={handleCommitDB}
        >
          Update DB
        </button>
      </div>
    </div>
  );
};

export default memo(HomePage);
