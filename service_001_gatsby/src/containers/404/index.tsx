import React from "react"

import SEO from "components/seo"

import Container from "./styled/Container"

const NotFoundPage = (): JSX.Element => (
  <>
    <SEO title="Not found" />
    <Container>
      <h1>NOT FOUND</h1>
      <p>This route doesn&#39;t exist... </p>
    </Container>
  </>
)

export default NotFoundPage
