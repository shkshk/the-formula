AppConfig = require('./config/application')
gulp = require('gulp')
gutil = require('gulp-util')
rimraf = require('rimraf')

express = require('express')
tinylr = require('tiny-lr')
livereload = require('gulp-livereload')
autoprefixer = require('gulp-autoprefixer')
stylus = require('gulp-stylus')
browserify = require('browserify')
cjsxify = require('cjsxify')
source = require('vinyl-source-stream')
deploy = require('gulp-gh-pages')

lr = tinylr()
server = express()
server.use(require('connect-livereload')())
server.use(express.static(AppConfig.buildpaths.root))
bundler = browserify(AppConfig.browserify)

gulp.task 'clean:html', (cb) -> rimraf('build/**/*.html', cb)
gulp.task 'clean:stylesheets', (cb) -> rimraf('build/stylesheets', cb)
gulp.task 'clean:javascripts', (cb) -> rimraf('build/javascripts', cb)
gulp.task 'clean', (cb) -> rimraf('build/', cb)

gulp.task 'html', ['clean:html'], ->
  gulp.src(AppConfig.paths.views)
    .pipe(gulp.dest(AppConfig.buildpaths.root))
    .pipe(livereload(lr))

gulp.task 'stylesheets', ['clean:stylesheets'], ->
  gulp.src(AppConfig.paths.mainstylesheet)
    .pipe(stylus())
    .pipe(autoprefixer())
    .pipe(gulp.dest(AppConfig.buildpaths.stylesheets))
    .pipe(livereload(lr))

gulp.task 'javascripts', ['clean:javascripts'], ->
  bundler.transform('cjsxify')
    .bundle()
    .pipe(source('application.js'))
    .pipe(gulp.dest(AppConfig.buildpaths.javascripts))
    .pipe(livereload(lr))

gulp.task 'build', ['html', 'stylesheets', 'javascripts'], ->
  gulp.src('CNAME').pipe(gulp.dest(AppConfig.buildpaths.root))

gulp.task 'serve', ['build'], ->
  lr.listen(AppConfig.lrport)
  server.listen(AppConfig.serverport)
  gulp.watch(AppConfig.paths.views, ['html'])
  gulp.watch(AppConfig.paths.stylesheets, ['stylesheets'])
  gulp.watch(AppConfig.paths.javascripts, ['javascripts'])
  gutil.log("Listening on 0.0.0.0:#{AppConfig.serverport}")

gulp.task 'deploy', ['build'], ->
  gulp.src(AppConfig.buildpaths.build)
    .pipe(deploy())

gulp.task 'deploy:ci', ['build'], ->
  gulp.src(AppConfig.buildpaths.build)
    .pipe(deploy(remoteUrl: process.env.GH_REPO_URL))

gulp.task 'default', ['serve']
