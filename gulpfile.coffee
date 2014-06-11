gulp = require('gulp')
gutil = require('gulp-util')
rimraf = require('rimraf')

express = require('express')
tinylr = require('tiny-lr')
livereload = require('gulp-livereload')

paths =
  views: 'app/views/*.html'

serverport = 4000
lrport = 35729

lr = tinylr()
server = express()
server.use(require('connect-livereload')())
server.use(express.static('./build'))

gulp.task 'clean', (cb) -> rimraf('build/', cb)

gulp.task 'html', ['clean'], ->
  gulp.src(paths.views)
    .pipe(gulp.dest('build'))
    .pipe(livereload(lr))

gulp.task 'serve', ['html'], ->
  lr.listen(lrport)
  server.listen(serverport)
  gulp.watch(paths.views, ['html'])
  gutil.log("Listening on 0.0.0.0:#{serverport}")

gulp.task('default', -> gutil.log('hello world'))
