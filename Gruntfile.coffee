module.exports = ( grunt ) ->
  srcs = [
    'src/sega.coffee'
    'src/export.coffee'
  ]


  specs = [
    '.grunt/sega/spec_compiled/sega.js'
    '.grunt/sega/spec_compiled/export.js'
  ]

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    coffee:
      dist:
        options:
          join: true
        files:
          'dist/sega.js': srcs

      build:
        options:
          join: true
          sourceMap: true
        files:
          'build/sega.js': srcs

      spec:
        files: [
          expand: true
          cwd: 'spec'
          src: ['**/*.coffee']
          dest: '.grunt/sega/spec_compiled'
          ext: '.js'
        ]

    jasmine:
      build:
        src: ['build/**/*.js']
        options:
          specs: specs

    clean:
      build: ['build']
      spec:  ['.grunt/sega/spec_compiled']
      grunt: ['.grunt']

    watch:
      all:
        files: ['src/**/*.coffee']
        tasks: ['dist']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'

  grunt.registerTask 'default', ['watch']
  grunt.registerTask 'build',   ['coffee:build']
  grunt.registerTask 'dist',    ['coffee:dist']
  grunt.registerTask 'spec',    ['clean:spec', 'coffee:build', 'coffee:spec', 'jasmine:build', 'clean:spec']



# module.exports = ( grunt ) ->
#   srcs = [
#     'src/list.coffee'
#   ]

#   grunt.initConfig
#     pkg: grunt.file.readJSON('package.json')

#     meta:
#       banner:
#         '// Collection\n' +
#         '// version: <%= pkg.version %>\n' +
#         '// contributors: <%= pkg.contributors %>\n' +
#         '// license: <%= pkg.licenses[0].type %>\n'

#     coffee:
#       dist:
#         options:
#           join: true
#         files:
#           'dist/list.js': 'src/list.coffee'

#       build:
#         options:
#           join: true
#           sourceMap: true
#         files:
#           'build/list.js': 'src/list.coffee'

#       spec:
#         files: [
#           expand: true
#           cwd: 'spec'
#           src: ['**/*.coffee']
#           dest: '.grunt/list/spec_compiled'
#           ext: '.js'
#         ]

#     jasmine:
#       build:
#         src: ['build/list.js']
#         options:
#           specs: '.grunt/list/spec_compiled/**/*.js'
#           vendor: []
#           template: require('grunt-template-jasmine-istanbul')
#           templateOptions:
#             coverage: 'statistics/coverage/coverage.json'
#             report:
#               type: 'lcovonly'
#               options:
#                 dir: '.grunt/list/coverage/lcov'
#             thresholds:
#               lines: 60
#               statements: 60
#               branches: 60
#               functions: 60
#       html:
#         src: ['build/list.js']
#         options:
#           specs: '.grunt/list/spec_compiled/**/*.js'
#           vendor: []
#           template: require('grunt-template-jasmine-istanbul')
#           templateOptions:
#             coverage: 'statistics/coverage/coverage.json'
#             report:
#               type: 'html'
#               options:
#                 dir: 'statistics/coverage/html'
#             thresholds:
#               lines: 60
#               statements: 60
#               branches: 60
#               functions: 60

#     plato:
#       all:
#         options:
#           jshint: false
#         files:
#           'statistics/complexity' : ['.grunt/list/src_compiled/**/*.js']


#     clean:
#       build: ['build']
#       spec:  ['.grunt/list/spec_compiled']
#       grunt: ['.grunt']

#     watch:
#       all:
#         files: 'src/**/*.coffee'
#         tasks: ['build', 'spec']

#   grunt.registerTask 'watch',   ['coffee:build', 'watch']
#   grunt.registerTask 'spec',    ['clean:spec', 'coffee:build', 'coffee:spec', 'jasmine:build', 'clean:spec']
#   grunt.registerTask 'build',   ['coffee:build']
#   grunt.registerTask 'dist',    ['coffee:dist']
#   grunt.registerTask 'analyze', ['coffee','jasmine:html', 'plato']
