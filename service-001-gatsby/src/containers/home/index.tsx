import React from "react"

import SEO from "components/seo"

import Welcome from "./styled/Welcome"

const Home = (): JSX.Element => (
  <>
    <SEO title="Home" />
    <Welcome
      header="Chalk"
      content={
        "Production and Deployment Ready boilerplate ##adjeibohyen@hotmail.co.uk"
      }
    />
  </>
)

export default Home
