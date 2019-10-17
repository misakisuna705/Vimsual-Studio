//system

const gulp = require("gulp");
const del = require("del");

//html

const gulp_html_replace = require("gulp-html-replace");
const gulp_htmlmin = require("gulp-htmlmin");

//css + scss

const gulp_sass = require("gulp-sass");
const gulp_clean_css = require("gulp-clean-css");

//js + ts

const gulp_typescript = require("gulp-typescript");
const gulp_concat = require("gulp-concat");
const gulp_terser = require("gulp-terser");

//browser

const browser_sync = require("browser-sync").create();
const browser_close = require("browser-sync-close-hook");

//src

const src = {
  html: "src/index.html",
  css: "src/**/*.css",
  scss: "src/**/*.scss",
  js: "src/**/*.js",
  ts: "src/**/*.ts",
  png: "src/**/*.png",
  mp3: "src/**/*.mp3",
  mp4: "src/**/*.mp4"
};

//build

const build = {
  html: "build/index.html",
  css: "build/**/*.css",
  js: "build/**/*.js"
};

//init

exports.default = gulp.series(
  clean,
  gulp.parallel(replace_html, mov_css, trans_scss, minify_js, trans_ts),
  gulp.parallel(minify_html, minify_css, concat_js, mov_png, mov_mp3, mov_mp4),
  init_server,
  watch
);

//system

function clean() {
  return del(["build/", "dist/"]);
}

//html

function replace_html() {
  return gulp
    .src(src.html)
    .pipe(gulp_html_replace({ js: "script.min.js" }))
    .pipe(gulp.dest("build/"));
}

function minify_html() {
  return gulp
    .src(build.html)
    .pipe(gulp_htmlmin())
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

//css + scss

function mov_css() {
  return gulp.src(src.css).pipe(gulp.dest("build/"));
}

function trans_scss() {
  return gulp
    .src(src.scss)
    .pipe(gulp_sass())
    .pipe(gulp.dest("build/"));
}

function minify_css() {
  return gulp
    .src(build.css)
    .pipe(gulp_clean_css())
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

//js + ts

function minify_js() {
  return gulp
    .src(src.js)
    .pipe(gulp_terser())
    .pipe(gulp.dest("build/"));
}

function trans_ts() {
  return gulp
    .src(src.ts)
    .pipe(gulp_typescript())
    .pipe(gulp_terser())
    .pipe(gulp.dest("build/"));
}

function concat_js() {
  return gulp
    .src(build.js)
    .pipe(gulp_concat("script.min.js"))
    .pipe(gulp.dest("dist/"))
    .pipe(browser_sync.stream());
}

//assets

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

//browser

function watch() {
  gulp.watch(src.html, replace_html);
  gulp.watch(build.html, minify_html);

  gulp.watch(src.css, mov_css);
  gulp.watch(src.scss, trans_scss);
  gulp.watch(build.css, minify_css);

  gulp.watch(src.js, minify_js);
  gulp.watch(src.ts, trans_ts);
  gulp.watch(build.js, concat_js);
}
