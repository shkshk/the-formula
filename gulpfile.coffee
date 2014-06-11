gulp = require('gulp')
gutil = require('gulp-util')
rimraf = require('rimraf')

express = require('express')
tinylr = require('tiny-lr')
livereload = require('gulp-livereload')
stylus = require('gulp-stylus')

paths =
  views: 'app/views/**/*.html'
  stylesheets: 'app/assets/stylesheets/**/*.styl'
  mainstylesheet: 'app/assets/stylesheets/application.styl'

buildpaths =
  views: 'build'
  stylesheets: 'build/assets/stylesheets'

serverport = 4000
lrport = 35729

lr = tinylr()
server = express()
server.use(require('connect-livereload')())
server.use(express.static('./build'))

gulp.task 'clean', (cb) -> rimraf('build/', cb)

gulp.task 'html', ['clean'], ->
  gulp.src(paths.views)
    .pipe(gulp.dest(buildpaths.views))
    .pipe(livereload(lr))

gulp.task 'stylesheets', ['clean'], ->
  gulp.src(paths.mainstylesheet)
    .pipe(stylus())
    .pipe(gulp.dest(buildpaths.stylesheets))
    .pipe(livereload(lr))

gulp.task 'serve', ['html', 'stylesheets'], ->
  lr.listen(lrport)
  server.listen(serverport)
  gulp.watch(paths.views, ['html'])
  gulp.watch(paths.stylesheets, ['stylesheets'])
  gutil.log("Listening on 0.0.0.0:#{serverport}")

gulp.task('default', -> gutil.log('hello world'))
