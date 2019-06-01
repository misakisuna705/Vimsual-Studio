const gulp = require("gulp");
const del = require("del");
const gulp_htmlmin = require("gulp-htmlmin");
const gulp_sass = require("gulp-sass");
const gulp_clean_css = require("gulp-clean-css");
const gulp_typescript = require("gulp-typescript");
const gulp_terser = require("gulp-terser");
const browser_sync = require("browser-sync").create();
const browser_close = require("browser-sync-close-hook");

const src = {
  html: "src/**/*.html",
  css: "src/**/*.css",
  scss: "src/**/*.scss",
  js: "src/**/*.js",
  ts: "src/**/*.ts",
  png: "src/**/*.png",
  mp3: "src/**/*.mp3",
  mp4: "src/**/*.mp4"
};

const build = {
  css: "build/**/*.css",
  js: "build/**/*.js"
};

function clean() {
  return del(["build/", "dist/"]);
}

function min_html() {
  return gulp
    .src(src.html)
    .pipe(gulp_htmlmin())
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

function mov_css() {
  return gulp.src(src.css).pipe(gulp.dest("build/"));
}

function trans_scss() {
  return gulp
    .src(src.scss)
    .pipe(gulp_sass())
    .pipe(gulp.dest("build/"));
}

function min_css() {
  return gulp
    .src(build.css)
    .pipe(gulp_clean_css())
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

function mov_js() {
  return gulp.src(src.js).pipe(gulp.dest("build/"));
}

function trans_ts() {
  return gulp
    .src(src.ts)
    .pipe(gulp_typescript())
    .pipe(gulp.dest("build/"));
}

function min_js() {
  return gulp
    .src(build.js)
    .pipe(gulp_terser())
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

function mov_png() {
  return gulp
    .src(src.png)
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

function mov_mp3() {
  return gulp
    .src(src.mp3)
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

function mov_mp4() {
  return gulp
    .src(src.mp4)
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

function init_server(done) {
  browser_sync.init({
    server: "dist/"
  });

  browser_sync.use({
    plugin() {},
    hooks: {
      "client:js": browser_close
    }
  });

  done();
}

function watch() {
  gulp.watch(src.html, min_html);
  gulp.watch(src.css, mov_css);
  gulp.watch(src.scss, trans_scss);
  gulp.watch(build.css, min_css);
  gulp.watch(src.js, min_js);
  gulp.watch(src.ts, trans_ts);
  gulp.watch(build.js, min_js);
}

exports.default = gulp.series(
  clean,
  gulp.parallel(mov_css, trans_scss, mov_js, trans_ts),
  gulp.parallel(min_html, min_css, min_js, mov_png, mov_mp3, mov_mp4),
  init_server,
  watch
);
