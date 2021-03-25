"use strict";

const pluginId = require("../../admin/src/pluginId");

const params = {
  username: process.env.CMS_ADMIN_USER || "admin",
  password: process.env.CMS_ADMIN_PASSWORD || "admin",
  email: process.env.CMS_ADMIN_EMAIL || "your.email@company.com",
  blocked: false,
  isActive: true,
};

const isExistingAdmin = async () => {
  return await strapi.query("user", "admin").findOne();
};

const isSuperAdminRoleAvailable = async () => {
  return await strapi
    .query("role", "admin")
    .findOne({ code: "strapi-super-admin" });
};

const isPublicRoleAvailable = async () => {
  return await strapi
    .query("role", "users-permissions")
    .findOne({ type: "public" });
};

const createEncryptedPassword = async () => {
  params.password = await strapi.admin.services.auth.hashPassword(
    params.password
  );
};

const createSuperAdminRole = async () => {
  params.roles = await strapi.query("role", "admin").create({
    name: "Super Admin",
    code: "strapi-super-admin",
    description:
      "Super Admins can access and manage all features and settings.",
  });
};

const createAdminAccount = async () => {
  await strapi.query("user", "admin").create({
    ...params,
  });
};

const logAdminCredentials = async () => {
  strapi.log.info("Admin account was successfully created.");
  strapi.log.info(`Email: ${params.email}`);
  strapi.log.info(`Password: ${params.password}`);
  return true;
};

const enablePublicPermissionsFor = async (pluginId) => {
  const role = await isPublicRoleAvailable();
  role.permissions.forEach((permission) => {
    if (permission.type === pluginId) {
      let newPermission = permission;
      newPermission.enabled = process.env.NODE_ENV === "development";
      strapi
        .query("permission", "users-permissions")
        .update({ id: newPermission.id }, newPermission);
    }
  });
};

/**
 * An asynchronous bootstrap function that runs before
 * your application gets started.
 *
 * This gives you an opportunity to set up your data model,
 * run jobs, or perform some special logic.
 *
 * See more details here: https://strapi.io/documentation/developer-docs/latest/concepts/configurations.html#bootstrap
 */

module.exports = async () => {
  // create admin account
  process.env.INITIAL_SETUP && (await isExistingAdmin()) && process.exit(0);
  process.env.INITIAL_SETUP &&
    !(await isSuperAdminRoleAvailable()) &&
    (await createSuperAdminRole());
  process.env.INITIAL_SETUP && (await createEncryptedPassword());
  process.env.INITIAL_SETUP && (await createAdminAccount());
  process.env.INITIAL_SETUP && (await logAdminCredentials()) && process.exit(0);

  // enable public permissions for plugin
  (await isPublicRoleAvailable()) &&
    (await enablePublicPermissionsFor(pluginId));
};
