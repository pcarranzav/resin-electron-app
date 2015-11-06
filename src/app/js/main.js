require.config({
	baseUrl: '/js',
	waitSeconds: 60,
	paths: {
		almond: '../bower_components/almond/almond',
		angular: '../bower_components/angular/angular',
		cache: '../bower_components/require-cache/cache',
		'coffee-script': '../bower_components/coffee-script/extras/coffee-script',
		cs: '../bower_components/require-cs/cs',
		lodash: '../bower_components//lodash/lodash.min',
		bluebird: '../bower_components/bluebird/js/browser/bluebird.min',
		jquery: '../bower_components/jquery/dist/jquery.min',
		bootstrap: '../bower_components/bootstrap/dist/js/bootstrap.min',
		'angular-bootstrap': '../bower_components/angular-bootstrap/ui-bootstrap-tpls.min'
	},
	shim: {
		angular: {
			exports: 'angular',
			deps: [ 'jquery' ]
		},
		bootstrap: {
			deps: [ 'jquery' ]
		},
		'angular-bootstrap': {
			deps: [ 'angular' ]
		},
		cs: {
			deps: [ 'cache' ]
		}
	}
})

require([ 'angular', 'cs!./app' ], function (angular, app) {
	if (document.readyState === 'complete') {
		angular.bootstrap(document, [ 'app' ])
	} else {
		// Not ready yet.
		angular.element(document).ready(function () {
			angular.bootstrap(document, [ 'app' ])
		})
	}
})
