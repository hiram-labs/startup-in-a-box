exports.createPages = async ({ actions, graphql, reporter }) => {
  // const { createPage } = actions
  // const newsTemplate = require.resolve(`./src/templates/NewsTemplate.tsx`)
  // const newsResult = await graphql(`
  //   {
  //     allMarkdownRemark(
  //       filter: { frontmatter: { section: { eq: "news" } } }
  //       sort: { order: DESC, fields: frontmatter___date }
  //     ) {
  //       edges {
  //         node {
  //           excerpt
  //           frontmatter {
  //             slug
  //             tags
  //             title
  //             date(formatString: "(DD / MM / YYYY)")
  //             category
  //           }
  //         }
  //       }
  //     }
  //   }
  // `)
  // if (newsResult.errors) {
  //   reporter.panicOnBuild(`Error while running GraphQL query.`)
  //   return
  // }
  // const posts = newsResult.data.allMarkdownRemark.edges
  // posts.forEach(({ node }, index) => {
  //   createPage({
  //     path: node.frontmatter.slug,
  //     component: newsTemplate,
  //     context: {
  //       slug: node.frontmatter.slug,
  //       tags: node.frontmatter.tags,
  //       previous: index === 0 ? null : posts[index - 1].node,
  //       next: index === posts.length - 1 ? null : posts[index + 1].node,
  //     },
  //   })
  // })
}
