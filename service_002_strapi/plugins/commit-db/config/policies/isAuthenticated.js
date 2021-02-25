const { exec } = require("child_process");

module.exports = async (ctx, next) => {
  console.log(ctx);
  if (ctx.state.user) {
    exec("yarn dump-db", (error) => {
      if (error) {
        console.error(error);
        return;
      }
    });
    return await next();
  }
  ctx.unauthorized("Forbiden action, possible permissions issue!");
};
