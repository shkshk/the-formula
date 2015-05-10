module.exports =
  paths:
    views: "app/views/**/*.html"
    stylesheets: "app/stylesheets/**/*.css"
    javascripts: "app/javascripts/**/*.{cjsx,coffee}"
    mainstylesheet: "app/stylesheets/application.styl"
    mainscript: "app/javascripts/application.cjsx"

  buildpaths:
    build: "build/**/*"
    root: "build"
    stylesheets: "build/stylesheets"
    javascripts: "build/javascripts"

  browserify:
    entries: ["./app/javascripts/application.cjsx"]
    extensions: [".cjsx", ".coffee"]
    paths: ["./app/javascripts"]

  serverport: 4000
  lrport: 35729
