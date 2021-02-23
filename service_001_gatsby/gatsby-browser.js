// import "./src/styles/global.scss"
require("./src/styles/global.scss")

const React = require("react")
const { Layout } = require("./src/layout")

exports.wrapPageElement = ({ element, props }) => {
  return <Layout {...props}>{element}</Layout>
}

// exports.onInitialClientRender = () => {}
