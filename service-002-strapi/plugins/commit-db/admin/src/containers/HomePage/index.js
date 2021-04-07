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
    .then(({ data }) =>
      strapi.notification.toggle({
        type: "success",
        message: {
          id: "app.notification.success",
          defaultMessage: data.message || "Done!",
        },
      })
    )
    .catch(({ response }) =>
      strapi.notification.toggle({
        type: "warning",
        message: {
          id: "app.notification.warning",
          defaultMessage: response.data.message || "Error!",
        },
      })
    )
    .then(() => strapi.unlockApp());
};

const HomePage = () => {
  return (
    <div className="p-5">
      <div className="card text-center" style={{ width: "400px" }}>
        <div className="card-body">
          <p
            className="card-title"
            style={{ fontSize: "1.25em", fontWeight: "bold" }}
          >
            Update dump file
          </p>
          <p className="card-text">Populate the strapi.sql file.</p>
          <button
            type="button"
            className="p-2 btn btn-outline-primary"
            onClick={handleCommitDB}
          >
            Update DB
          </button>
        </div>
      </div>
    </div>
  );
};

export default memo(HomePage);
