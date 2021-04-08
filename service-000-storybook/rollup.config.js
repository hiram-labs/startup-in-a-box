import typescript from "@rollup/plugin-typescript";
import banner from "rollup-plugin-banner";
import scss from "rollup-plugin-scss";
import pkg from "./package.json";

const rollup = {
  input: "src/index.js",
  output: [
    {
      name: "Storybook",
      file: "src/caddy/site/bundle-cjs.js",
      format: "cjs",
    },
    { name: "Storybook", file: "src/caddy/site/bundle-es.js", format: "es" },
  ],
  external: [
    ...Object.keys(pkg.dependencies || {}),
    ...Object.keys(pkg.devDependencies || {}),
    ...Object.keys(pkg.peerDependencies || {}),
  ],
  plugins: [
    typescript(),
    scss(),
    banner(
      "<%= pkg.name %>\nv<%= pkg.version %>\n<%= pkg.license %>\nby <%= pkg.author %>\ncontributors <%= pkg.contributors %>\n<%= pkg.description %>\n<%= pkg.homepage %>"
    ),
  ],
};

export default rollup;

// start dev server - yarn storybook
// build bundle to host on caddy - export NODE_PATH=$(npm root --quiet -g) && rollup -c
