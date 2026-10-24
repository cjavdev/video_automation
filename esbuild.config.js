const path = require('path')
const rails = require('esbuild-rails')

const options = {
  entryPoints: ["application.js"],
  bundle: true,
  outdir: path.join(process.cwd(), "app/assets/builds"),
  absWorkingDir: path.join(process.cwd(), "app/javascript"),
  plugins: [rails()],
}

const esbuild = require("esbuild")

if (process.argv.includes("--watch")) {
  esbuild.context(options).then(ctx => ctx.watch()).catch((e) => { console.error(e); process.exit(1) })
} else {
  esbuild.build(options).catch((e) => { console.error(e); process.exit(1) })
}
