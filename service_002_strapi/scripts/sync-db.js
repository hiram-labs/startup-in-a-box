const fs = require("fs");
const util = require("util");
const path = require("path");
const mysql = require("mysql");
const bcrypt = require("bcrypt");

const password = process.env.CMS_ADMIN_PASSWORD;
const connectionConfig = {
  host: process.env.DATABASE_HOST,
  port: process.env.DATABASE_PORT,
  user: process.env.DATABASE_USERNAME,
  password: process.env.DATABASE_PASSWORD,
  database: process.env.DATABASE_NAME,
  multipleStatements: true,
  acquireTimeout: 30000,
  connectTimeout: 30000,
};

const connection = mysql.createConnection(connectionConfig);
const query = util.promisify(connection.query).bind(connection);
const statements = fs
  .readFileSync(path.join(__dirname, "../../service_000_mysql/backup/init.sql"))
  .toString();

let attempts = 0;

const connectToDB = () =>
  new Promise((resolve, reject) => {
    if (attempts < 3) {
      console.log(
        `${
          attempts < 1 ? "starting" : "restarting"
        } sync-db connection to db...`
      );
      connection.connect((error) => {
        if (error) {
          attempts += 1;
          setTimeout(() => {
            connectToDB();
          }, 10000);
        } else {
          resolve();
        }
      });
    } else {
      reject(error);
    }
  });

disconnectFromDB = () =>
  new Promise((resolve) => {
    connection.end(() => {
      console.log("sync-db connection to db closed.");
      resolve();
    });
  });

connectToDB()
  .then(async () => {
    let isExistingAdmin = false;
    const encryptedPassword = await bcrypt.hash(password, 10);

    console.log("Disabling foreign key checks...");
    await query("SET FOREIGN_KEY_CHECKS=0").catch((error) => {
      throw error;
    });

    console.log("Listing tables...");
    let dropStatement = "select 1";
    await query("show tables")
      .then((results) => {
        if (results.length) {
          var key = Object.keys(results[0])[0];
          var tableNames = results.map((row) => row[key]);
          dropStatement = `drop table ${tableNames
            .map((name) => `\`${name}\``)
            .join(",")}`;
        }
      })
      .catch((error) => {
        throw error;
      });

    console.log("Dropping tables...");
    await query(dropStatement).catch((error) => {
      throw error;
    });

    console.log("Re-enabling foreign key checks...");
    await query("SET FOREIGN_KEY_CHECKS=1").catch((error) => {
      throw error;
    });

    console.log("Running init.sql...");
    await query(statements).catch((error) => {
      throw error;
    });

    await query("select * from strapi_administrator")
      .then(() => {
        isExistingAdmin = true;
        console.log("Updating admin password");
      })
      .catch(() => {
        console.log("Initial setup! No admin account found");
      });

    isExistingAdmin &&
      (await query(
        `UPDATE strapi_administrator SET password='${
          encryptedPassword || password
        }' WHERE username='root'`
      ).catch((error) => {
        throw error;
      }));

    await disconnectFromDB().catch(() => {
      throw error;
    });
  })
  .catch((error) => {
    throw error;
  })
  .finally(() => {
    process.exit(0);
  });
