define [
	'angular',
	'lodash',
],
(angular, _) ->

	angular
		.module('app', [])
		.run(['$rootScope', ($rootScope) ->
			$rootScope.playMoney = ->
				audio = new Audio(__dirname + '/wav/money.wav')
				audio.currentTime = 0
				audio.play()
		])
