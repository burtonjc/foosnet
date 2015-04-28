module.exports = (grunt) ->

  grunt.initConfig
    jshint:
      all: [
        'Gruntfile.js'
        'server/src/**/*.js'
      ],
      options:
          jshintrc: '.jshintrc'

    watch:
      test:
        files: ['server/**/*.coffee']
        tasks: ['mochaTest:server']

    mochaTest:
      server:
        options:
          reporter: 'spec'
          require: [
            'coffee-script/register'
            'co-mocha'
            'server/spec/spec-global.coffee'
          ]
        src: [
          'server/spec/spec-helper.coffee'
          'server/spec/**/*[Ss]pec.coffee'
        ]

    less:
      build:
        files:
          './client/css/main.css': './client/styles/**/*.less'


  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-mocha-test'

  grunt.task.registerTask 'test', ['mochaTest:server']
  grunt.task.registerTask 'default', ['jshint', 'test']
