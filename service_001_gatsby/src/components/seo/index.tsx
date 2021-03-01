import React from "react"
import { Helmet } from "react-helmet"
import { useStaticQuery, graphql } from "gatsby"

interface IProps {
  description?: string
  lang?: string
  meta?: HTMLMetaElement[]
  image?: string
  title: string
}

const SEO = ({
  description = "",
  lang = "en",
  meta = [],
  image,
  title,
}: IProps): JSX.Element => {
  const { data } = useStaticQuery(
    graphql`
      query {
        data: site {
          siteMetadata {
            author
            description
            image
            title
          }
        }
      }
    `
  )

  const metaDescription = description || data.siteMetadata.description
  const metaImage = image || data.siteMetadata.image

  return (
    <Helmet
      htmlAttributes={{
        lang,
      }}
      title={title}
      titleTemplate={`%s | ${data.siteMetadata.title}`}
      meta={[
        {
          name: `description`,
          content: metaDescription,
        },
        {
          property: `og:title`,
          content: title,
        },
        {
          property: `og:description`,
          content: metaDescription,
        },
        {
          property: `og:type`,
          content: `website`,
        },
        {
          property: "og:image",
          content: metaImage,
        },
        {
          name: `twitter:card`,
          content: `summary`,
        },
        {
          name: `twitter:creator`,
          content: data.siteMetadata.author,
        },
        {
          name: `twitter:title`,
          content: title,
        },
        {
          name: `twitter:description`,
          content: metaDescription,
        },
        {
          name: "twitter:image",
          content: metaImage,
        },
      ].concat(meta)}
    />
  )
}

export default SEO
