let gulp = require('gulp');
let postcss = require('gulp-postcss');
let tailwindcss = require('tailwindcss');
let purgecss = require('gulp-purgecss');
let autoprefixer = require('gulp-autoprefixer');
let cleanCSS = require('gulp-clean-css');
let concat = require('gulp-concat');
let rename = require('gulp-rename');
let uglify = require('gulp-uglify');
let hash = require('gulp-hash');
let references = require('gulp-hash-references');

gulp.task('css', function(){
  return gulp.src('./app/css/main.css')
  .pipe(postcss([
    tailwindcss('./tailwind.config.js'),
  ]))
  .pipe(purgecss({
    content: ['app/master.xsl', '../live/workspace/theme/**/*.xsl', '../live/workspace/theme/assets/**/*.js'],
    defaultExtractor: content =>
      content.match(/[\w-/:]+(?<!:)/g) || []
  }))
  .pipe(autoprefixer())
  .pipe(cleanCSS({compatibility: 'ie8'}))
  //.pipe(gulp.dest('./app/dist/css/'))
  .pipe(hash())
  .pipe(gulp.dest('../live/workspace/theme/assets/css/'))
  .pipe(hash.manifest('asset-manifest.json', {
    deleteOld: true,
    sourceDir: '../live/workspace/theme/assets/css/'
  }))
  .pipe(gulp.dest('.'));
});

gulp.task('js', function(){
  return gulp.src([
    './app/js/turbolinks.js',
    './app/js/jquery.js',
    './app/js/plugins.js',
    './app/js/main.js'
  ])
  .pipe(concat('main.js'))
  .pipe(uglify())
  //.pipe(gulp.dest('./app/dist/js/'))
  .pipe(hash())
  .pipe(gulp.dest('../live/workspace/theme/assets/js/'))
  .pipe(hash.manifest('asset-manifest.json', {
    deleteOld: true,
    sourceDir: '../live/workspace/theme/assets/js/'
  }))
  .pipe(gulp.dest('.'));
});

gulp.task('html', function(){
  return gulp.src('app/master.xsl')
  .pipe(references('asset-manifest.json'))
  .pipe(gulp.dest('../live/workspace/theme/templates/'))
});

gulp.task('default', function(){
  gulp.watch(['app/css/**/*.css', './tailwind.config.js', 'app/master.xsl', '../live/workspace/theme/**/*.xsl', '!../live/workspace/theme/templates/master.xsl'], gulp.series('css'));
  gulp.watch(['app/js/**/*.js'], gulp.series('js'));
  gulp.watch(['asset-manifest.json'], gulp.series('html'));
});

// ./node_modules/.bin/gulp watch
