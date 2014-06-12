gulp = require('gulp')
gutil = require('gulp-util')
rimraf = require('rimraf')

express = require('express')
tinylr = require('tiny-lr')
livereload = require('gulp-livereload')
stylus = require('gulp-stylus')
coffee = require('gulp-coffee')
include = require('gulp-include')

paths =
  views: 'app/views/**/*.html'
  stylesheets: 'app/assets/stylesheets/**/*.styl'
  javascripts: 'app/assets/javascripts/**/*.coffee'
  mainstylesheet: 'app/assets/stylesheets/application.styl'
  mainscript: 'app/assets/javascripts/application.coffee'

buildpaths =
  views: 'build'
  stylesheets: 'build/assets/stylesheets'
  javascripts: 'build/assets/javascripts'

serverport = 4000
lrport = 35729

lr = tinylr()
server = express()
server.use(require('connect-livereload')())
server.use(express.static('./build'))

gulp.task 'clean:html', (cb) -> rimraf('build/**/*.html', cb)
gulp.task 'clean:stylesheets', (cb) -> rimraf('build/assets/stylesheets', cb)
gulp.task 'clean:javascripts', (cb) -> rimraf('build/assets/javascripts', cb)
gulp.task 'clean', (cb) -> rimraf('build/', cb)

gulp.task 'html', ['clean:html'], ->
  gulp.src(paths.views)
    .pipe(gulp.dest(buildpaths.views))
    .pipe(livereload(lr))

gulp.task 'stylesheets', ['clean:stylesheets'], ->
  gulp.src(paths.mainstylesheet)
    .pipe(stylus())
    .pipe(gulp.dest(buildpaths.stylesheets))
    .pipe(livereload(lr))

gulp.task 'javascripts', ['clean:javascripts'], ->
  gulp.src(paths.mainscript)
    .pipe(include())
    .pipe(coffee())
    .pipe(gulp.dest(buildpaths.javascripts))
    .pipe(livereload(lr))

gulp.task 'serve', ['html', 'stylesheets', 'javascripts'], ->
  lr.listen(lrport)
  server.listen(serverport)
  gulp.watch(paths.views, ['html'])
  gulp.watch(paths.stylesheets, ['stylesheets'])
  gulp.watch(paths.javascripts, ['javascripts'])
  gutil.log("Listening on 0.0.0.0:#{serverport}")

gulp.task('default', -> gutil.log('hello world'))
