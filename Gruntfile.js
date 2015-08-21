module.exports = function(grunt) {

  require('load-grunt-tasks')(grunt);

    grunt.initConfig({
        cssmin: {
            target: {
              files: [{
                expand: true,
                cwd: 'assets/stylesheets',
                src: ['*.css', '!*.min.css'],
                dest: 'assets/stylesheets',
                ext: '.min.css'
              }]
            }
        },

      purifycss: {
        options: {},
        target: {
          src: [
              'templates/about/*.tpl',
              'templates/about/*.tpl',
              'templates/admin/*.tpl',
              'templates/article/*.tpl',
              'templates/author/*.tpl',
              'templates/citation/*.tpl',
              'templates/comment/*.tpl',
              'templates/common/*.tpl',
              'templates/controllers/*.tpl',
              'templates/copyeditor/*.tpl',
              'templates/editor/*.tpl',
              'templates/gateway/*.tpl',
              'templates/help/*.tpl',
              'templates/images/*.tpl',
              'templates/index/*.tpl',
              'templates/information/*.tpl',
              'templates/install/*.tpl',
              'templates/issue/*.tpl',
              'templates/layoutEditor/*.tpl',
              'templates/manager/*.tpl',
              'templates/notification/*.tpl',
              'templates/payments/*.tpl',
              'templates/proofreader/*.tpl',
              'templates/reviewer/*.tpl',
              'templates/rt/*.tpl',
              'templates/rtadmin/*.tpl',
              'templates/search/*.tpl',
              'templates/sectionEditor/*.tpl',
              'templates/submission/*.tpl',
              'templates/subscription/*.tpl',
              'templates/user/*.tpl',
              'assets/js/*.js',
              'components/bootstrap-sass/assets/javascripts/*.js',
              'components/bootstrap-sass/assets/javascripts/bootstrap/*.js',
              'assets/js/ojs_dependencies/*.js'],
          css: ['assets/stylesheets/main.css'],
          dest: 'assets/stylesheets/main.css'
        },
      },
    });
    grunt.registerTask('default', ['purifycss', 'cssmin']);
};
