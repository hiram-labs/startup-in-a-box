require("dotenv").config()

module.exports = {
  // siteMetaData has been moved to `src/data/meta/index.json`
  plugins: [
    `gatsby-plugin-react-helmet`,
    {
      resolve: `gatsby-plugin-gdpr-cookies`,
      options: {
        googleAnalytics: {
          trackingId: `_trackingId`,
          cookieName: `gatsby-gdpr-google-analytics`,
          anonymize: true,
          allowAdFeatures: false,
        },
        environments: ["production"],
      },
    },
    {
      resolve: `gatsby-plugin-alias-imports`,
      options: {
        alias: {
          "@images": "src/images",
          "@components": "src/components",
          "@containers": "src/containers",
          "@markdown": "src/markdown",
        },
        extensions: ["js", "jsx", "ts", "tsx"],
      },
    },
    {
      resolve: `gatsby-source-filesystem`,
      options: {
        name: `images`,
        path: `${__dirname}/src/images`,
      },
    },
    {
      resolve: `gatsby-source-filesystem`,
      options: {
        name: `data`,
        path: `${__dirname}/src/data/`,
        ignore: [`**/\.*`],
      },
    },
    {
      resolve: `gatsby-source-filesystem`,
      options: {
        name: `markdown`,
        path: `${__dirname}/src/markdown`,
      },
    },
    `gatsby-transformer-remark`,
    `gatsby-transformer-sharp`,
    `gatsby-plugin-sharp`,
    {
      resolve: `gatsby-plugin-manifest`,
      options: {
        name: `Startup In A Box`,
        short_name: `siab`,
        start_url: `/`,
        background_color: `#eef2f2`,
        theme_color: `#eef2f2`,
        display: `minimal-ui`,
        icon: `src/images/logos/siab_full.png`, // This path is relative to the root of the site.
      },
    },
    `gatsby-transformer-json`,
    `gatsby-plugin-styled-components`,
    `gatsby-plugin-scss-typescript`,
    // `gatsby-plugin-offline`,
  ],
}
