require("dotenv").config()
import { customMeta, description, author } from "./package.json"

module.exports = {
  siteMetadata: {
    title: customMeta.companyName,
    image: `/images/logos/base_full.png`,
    description: description,
    author: author,
  },
  plugins: [
    `gatsby-plugin-react-helmet`,
    {
      resolve: `gatsby-plugin-gdpr-cookies`,
      options: {
        googleAnalytics: {
          trackingId: customMeta.gtagID,
          cookieName: `gatsby-gdpr-google-analytics`,
          anonymize: true,
          allowAdFeatures: false,
        },
        environments: [`production`],
      },
    },
    {
      resolve: `gatsby-plugin-alias-imports`,
      options: {
        alias: {
          images: "src/images",
          components: "src/components",
          containers: "src/containers",
          markdown: "src/markdown",
        },
        extensions: [`js`, `jsx`, `ts`, `tsx`],
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
        name: customMeta.companyName,
        short_name: customMeta.companyNameShort,
        start_url: `/`,
        background_color: `#eef2f2`,
        theme_color: `#eef2f2`,
        display: `minimal-ui`,
        icon: `src/images/logos/base_full.png`,
      },
    },
    `gatsby-transformer-json`,
    `gatsby-plugin-styled-components`,
    `gatsby-plugin-scss-typescript`,
    // `gatsby-plugin-offline`,
  ],
}
