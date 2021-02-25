"use strict";

/**
 * An asynchronous bootstrap function that runs before
 * your application gets started.
 *
 * This gives you an opportunity to set up your data model,
 * run jobs, or perform some special logic.
 *
 * See more details here: https://strapi.io/documentation/developer-docs/latest/concepts/configurations.html#bootstrap
 */

const params = {
  username: process.env.CMS_ADMIN_USER || "admin",
  password: process.env.CMS_ADMIN_PASSWORD || "admin",
  email: process.env.CMS_ADMIN_EMAIL || "your.email@company.com",
  blocked: false,
  isActive: true,
};

module.exports = async () => {
  console.log("started");
  if (process.env.INITIAL_SETUP) {
    console.log("inside");
    // Create admin account
    const admins = await strapi.query("user", "admin").find({ _limit: 1 });
    if (admins.length) return;

    const superAdminRole = await strapi.admin.services.role.getSuperAdmin();
    const encryptedPassword = await strapi.admin.services.auth.hashPassword(
      params.password
    );

    params.roles = [superAdminRole.id];
    params.password = encryptedPassword;

    await strapi.query("user", "admin").create({
      ...params,
    });
    console.info("Admin account created:", admin);

    // set db dump enpoint permissions to public
    const authenticated = await strapi
      .query("role", "users-permissions")
      .findOne({ type: "public" });

    authenticated.permissions.forEach((permission) => {
      if (permission.type === "commit-db") {
        let newPermission = permission;
        newPermission.enabled = true;
        strapi
          .query("permission", "users-permissions")
          .update({ id: newPermission.id }, newPermission);
      }
    });
  }
};
