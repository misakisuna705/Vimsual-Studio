const gulp = require("gulp");
const del = require("del");
const gulp_html_replace = require("gulp-html-replace");
const gulp_htmlmin = require("gulp-htmlmin");
const gulp_clean_css = require("gulp-clean-css");
const gulp_concat = require("gulp-concat");
const gulp_terser = require("gulp-terser");
const browser_sync = require("browser-sync").create();

const src = {
  html: "src/index.html",
  css: "src/**/*.css",
  js: "src/**/*.js",
  assets: ["src/**/*.png", "src/**/*.jpg", "src/**/*.mp3", "src/**/*.mp4"]
};

const build = {
  html: "build/index.html",
  css: "build/**/*.css",
  js: "build/**/*.js"
};

function clean() {
  return del(["build/", "dist/"]);
}

function tagHTML() {
  return gulp
    .src(src.html)
    .pipe(gulp_html_replace({ css: "style.min.css", js: "script.min.js" }))
    .pipe(gulp.dest("build/"));
}

function minHTML() {
  return gulp
    .src(build.html)
    .pipe(gulp_htmlmin())
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

function minCSS() {
  return gulp
    .src(src.css)
    .pipe(gulp_clean_css())
    .pipe(gulp.dest("build/"));
}

function minJS() {
  return gulp
    .src(src.js)
    .pipe(gulp_terser())
    .pipe(gulp.dest("build/"));
}

function mergCSS() {
  return gulp
    .src(build.css)
    .pipe(gulp_concat("style.min.css"))
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

function mergeJS() {
  return gulp
    .src(build.js)
    .pipe(gulp_concat("script.min.js"))
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

function movAssets() {
  return gulp
    .src(src.assets)
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

function runServer(done) {
  browser_sync.init({
    server: "dist/"
  });

  browser_sync.use({
    plugin() {},
    hooks: {
      "client:js": "(function (bs) {bs.socket.on('disconnect', function (client) { window.close(); });})(___browserSync___);"
    }
  });

  done();
}

function watch() {
  gulp.watch(src.html, tagHTML);
  gulp.watch(build.html, minHTML);
  gulp.watch(src.css, minCSS);
  gulp.watch(build.css, mergCSS);
  gulp.watch(src.js, minJS);
  gulp.watch(build.js, mergeJS);
}

exports.default = gulp.series(
  clean,
  gulp.parallel(tagHTML, minCSS, minJS),
  gulp.parallel(minHTML, mergCSS, mergeJS, movAssets),
  runServer,
  watch
);
