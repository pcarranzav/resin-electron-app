module.exports = (grunt) ->
	grunt.initConfig

		clean:
			build: [ 'build' ]
			templateCache: [ 'build/templateCache.js' ]

		copy:
			src:
				files: [
					expand: true
					cwd: 'app'
					src: '**/*.{css,html,wav,png,jpg,jpeg,gif,swf,svg,eot,ttf,otf,woff,woff2}'
					dest: 'build'
				]

		processhtml:
			src:
				files: [
					expand: true
					cwd: 'build/'
					src: [ '*.html' ]
					dest: 'build/'
				]

		less:
			main:
				options:
					compress: true
					relativeUrls: true
				files:
					'build/main.css': 'app/css/main.less'

		requirejs:
			main:
				options:
					baseUrl: 'app/js'
					mainConfigFile: 'app/js/main.js'
					out: 'build/main.js'
					name: 'main'
					optimize: 'none'
					preserveLicenseComments: false
					stubModules: [
						'text'
						'css'
						'cs'
						'json'
					]
					include: ['almond']
					excludeShallow: [
						'cache',
						'coffee-script'
						'uglify-js'
					]

		uglify:
			options:
				mangle: true
				compress: true
			src:
				files:
					'build/main.js': ['build/main.js']

	require('load-grunt-tasks')(grunt)

	grunt.registerTask 'build', [
		'clean:build'
		'copy'

		'less'

		'requirejs'


		'processhtml'
	]
