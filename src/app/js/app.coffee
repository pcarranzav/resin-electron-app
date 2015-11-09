define [
	'angular',
	'lodash',
],
(angular, _) ->

	console.log('hey')
	theApp = angular.module('drumApp', [])

	theApp.controller 'DrumMachineController', [ '$scope', '$timeout', '$interval', ($scope, $timeout, $interval) ->
		soundFiles = [
			__dirname + '/wav/git.wav'
			__dirname + '/wav/push.wav'
			__dirname + '/wav/resin.wav'
			__dirname + '/wav/master.wav'
		]
		console.log('loading controller')
		$scope.sounds = _.map soundFiles, (file) ->
			sound = new Audio(file)
			filenameParts = file.split('/')
			sound.filename = filenameParts[filenameParts.length - 1].split('.')[0]
			sound.playQueue = [ {isActive: false}, {isActive: false}, {isActive: false}, {isActive: false} ]
			return sound

		$scope.beatMarker = [ {isActive: false}, {isActive: false}, {isActive: false}, {isActive: false} ]

		bpm = 120
		t = Date.now()
		nextSecond = Math.round( (t + 1000) / 1000 ) * 1000
		$scope.currentSlot = 0
		$timeout ->
			$interval ->
				$scope.beatMarker[$scope.currentSlot].isActive = true
				_.each $scope.sounds, (sound) ->
					if sound.playQueue[$scope.currentSlot].isActive
						sound.currentTime = 0
						sound.play()
				$scope.beatMarker[$scope.currentSlot].isActive = false
				$scope.currentSlot = ( $scope.currentSlot + 1 ) % 4
				$scope.beatMarker[$scope.currentSlot].isActive = true

			, 60000 / bpm
		, nextSecond - t
	]