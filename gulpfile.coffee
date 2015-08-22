# Load all required libraries.
gulp = require 'gulp'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
istanbul = require 'gulp-istanbul'
mocha = require 'gulp-mocha'
plumber = require 'gulp-plumber'
batch = require('gulp-batch')

swallowError = (error) -> error.end()

gulp.on 'err', (e) ->
  gutil.beep()
  gutil.log e.err.stack

gulp.task 'coffee', ->
  gulp.src './src/**/*.coffee'
    .pipe plumber() # Pevent pipe breaking caused by errors from gulp plugins
    .pipe coffee({bare: true})
    .pipe gulp.dest './lib/'

gulp.task 'test', ['coffee'], ->
  gulp.src ['lib/**/*.js']
    .pipe(istanbul()) # Covering files
    .pipe(istanbul.hookRequire()) # Overwrite require so it returns the covered files
    .on 'finish', ->
      gulp.src(['test/**/*.spec.coffee', 'test/**/*.spec.js'])
        .pipe mocha reporter: 'spec', compilers: 'coffee:coffee-script'
        .pipe istanbul.writeReports() # Creating the reports after tests run

gulp.task 'watch', [], ->
  stuff_to_watch = ['./src/**/*.coffee', './src/**/*.js', './test/**/*.coffee', './test/**/*.js']
  gulp.watch(stuff_to_watch, batch( (events, done) ->
    gulp.start('test', done)
  )).on('error', swallowError)

gulp.task 'default', ['watch']
