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

        watch: {
            test: {
                files: ['server/**/*.js'],
                tasks: ['mochaTest:server']
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

    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-mocha-test');

    grunt.task.registerTask('test', ['mochaTest:server']);
    grunt.task.registerTask('default', ['jshint', 'test']);
};
