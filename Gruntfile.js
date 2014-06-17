module.exports = function(grunt) {

    // Configuration goes here
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        compass: {
            dev: {
                options: {
                        sassDir: 'sass',
                        cssDir: 'css',
                }
            }
        },
        watch: {
            compass: {
                files: ['sass/*.scss'],
                tasks: ['compass'],
                options: {
                    livereload: true
                }
            },
            livereload: {
                options: {
                    livereload: true,
                },
                files: [
                        'js/*.js',
                        '**/*.php'
                ],
            }
        }

    });

    // Load tasks so we can use them
    grunt.loadNpmTasks("grunt-contrib-compass");
    grunt.loadNpmTasks("grunt-contrib-watch");
    grunt.loadNpmTasks("grunt-contrib-cssmin");
    grunt.loadNpmTasks("grunt-contrib-concat");

    grunt.registerTask('default', 'less');

};