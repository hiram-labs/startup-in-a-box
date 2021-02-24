const mysqldump = require("mysqldump");
const path = require("path");

const backupPath = path.join(__dirname, "../service_002_strapi/init.sql");
mysqldump({
  connection: {
    host: process.env.DATABASE_HOST,
    port: process.env.DATABASE_PORT,
    user: process.env.DATABASE_USERNAME,
    password: process.env.DATABASE_PASSWORD,
    database: process.env.DATABASE_NAME,
  },
  dumpToFile: backupPath,
});
