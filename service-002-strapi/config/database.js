module.exports = ({ env }) => ({
  defaultConnection: "default",
  connections: {
    default: {
      connector: "bookshelf",
      settings: {
        client: "mysql",
        host: env("DATABASE_HOST", "127.0.0.1"),
        port: env.int("DATABASE_PORT", 3308),
        database: env("DATABASE_NAME", "mysql_db"),
        username: env("DATABASE_USERNAME", "root"),
        password: env("DATABASE_PASSWORD", "root"),
        ssl: env.bool("DATABASE_SSL", true),
      },
      options: {},
    },
  },
});
