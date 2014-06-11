gulp = require('gulp')
gutil = require('gulp-util')
express = require('express')

serverport = 4000
server = express()
server.use(express.static('./build'))

gulp.task 'html', ->
  gulp.src('app/views/*.html')
    .pipe(gulp.dest('build'))

gulp.task 'serve', ['html'], ->
  server.listen(serverport)
  gutil.log("Listening on 0.0.0.0:#{serverport}")

gulp.task('default', -> gutil.log('hello world'))
