module.exports = function(grunt) {

  grunt.initConfig({
    jshint: {
      all: [
        'Gruntfile.js',
        'server/src/**/*.js'
      ],
      options: {
        jshintrc: '.jshintrc'
      }
    },

    mochaTest: {
      server: {
        options: {
          reporter: 'spec'
        },
        src: [
          'server/spec/spec-global.js',
          'server/spec/**/*[Ss]pec.js'
        ]
      }
    }
  });

  grunt.loadNpmTasks('grunt-mocha-test');
  grunt.loadNpmTasks('grunt-contrib-jshint');

  grunt.task.registerTask('test', ['mochaTest:server']);
  grunt.task.registerTask('default', ['jshint', 'test']);
};
