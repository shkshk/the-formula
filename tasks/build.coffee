AppConfig = require("../config/application")
postprocessors = require("../config/postcss")

gulp = require("gulp")
gutil = require("gulp-util")

express = require("express")
tinylr = require("tiny-lr")
livereload = require("gulp-livereload")
postcss = require("gulp-postcss")
browserify = require("browserify")
cjsxify = require("cjsxify")
source = require("vinyl-source-stream")

lr = tinylr()
server = express()
server.use(require("connect-livereload")())
server.use(express.static(AppConfig.buildpaths.root))
bundler = browserify(AppConfig.browserify)

gulp.task "html", ["clean:html"], ->
  gulp.src(AppConfig.paths.views)
    .pipe(gulp.dest(AppConfig.buildpaths.root))
    .pipe(livereload(lr))

gulp.task "stylesheets", ["clean:stylesheets"], ->
  gulp.src(AppConfig.paths.mainstylesheet)
    .pipe(postcss(postprocessors))
    .pipe(gulp.dest(AppConfig.buildpaths.stylesheets))
    .pipe(livereload(lr))

gulp.task "javascripts", ["clean:javascripts"], ->
  bundler.transform("cjsxify")
    .bundle()
    .pipe(source("application.js"))
    .pipe(gulp.dest(AppConfig.buildpaths.javascripts))
    .pipe(livereload(lr))

gulp.task "build", ["html", "stylesheets", "javascripts"], ->
  gulp.src("CNAME").pipe(gulp.dest(AppConfig.buildpaths.root))

gulp.task "serve", ["build"], ->
  lr.listen(AppConfig.lrport)
  server.listen(AppConfig.serverport)
  gulp.watch(AppConfig.paths.views, ["html"])
  gulp.watch(AppConfig.paths.stylesheets, ["stylesheets"])
  gulp.watch(AppConfig.paths.javascripts, ["javascripts"])
  gutil.log("Listening on 0.0.0.0:#{AppConfig.serverport}")
