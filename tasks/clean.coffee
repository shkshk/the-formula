gulp = require("gulp")
rimraf = require("rimraf")

gulp.task "clean:html", (cb) -> rimraf("build/**/*.html", cb)
gulp.task "clean:stylesheets", (cb) -> rimraf("build/stylesheets", cb)
gulp.task "clean:javascripts", (cb) -> rimraf("build/javascripts", cb)
gulp.task "clean", (cb) -> rimraf("build/", cb)
