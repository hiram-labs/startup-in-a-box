const fs = require("fs");
const util = require("util");
const path = require("path");
const mysql = require("mysql");
const bcrypt = require("bcrypt");

const connectionConfig = {
  host: process.env.DATABASE_HOST,
  port: process.env.DATABASE_PORT,
  user: process.env.DATABASE_USERNAME,
  password: process.env.DATABASE_PASSWORD,
  database: process.env.DATABASE_NAME,
};
const connection = mysql.createConnection(connectionConfig);
const query = util.promisify(connection.query).bind(connection);
const statements = fs
  .readFileSync(path.join(__dirname, "../init.sql"))
  .toString();
const password = bcrypt.hash(adminPassword, 10).then((hash) => hash);

console.log("Connecting to db...");
connection.connect().catch((error) => {
  throw error;
});

console.log("Disabling foreign key checks...");
query("SET FOREIGN_KEY_CHECKS=0").catch((error) => {
  throw error;
});

console.log("Listing tables...");
query("show tables")
  .then((results) => {
    var dropStatement = "select 1";
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
query(dropStatement).catch((error) => {
  throw error;
});

console.log("Re-enabling foreign key checks...");
query("SET FOREIGN_KEY_CHECKS=1").catch((error) => {
  throw error;
});

console.log("Running init.sql...");
query(statements).catch((error) => {
  throw error;
});

console.log("Updating admin password");
query(
  `UPDATE strapi_administrator SET password='${password}' WHERE username='root'`
).catch((error) => {
  throw error;
});

connection.end();
