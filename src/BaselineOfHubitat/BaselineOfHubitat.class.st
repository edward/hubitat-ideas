Class {
	#name : #BaselineOfHubitat,
	#superclass : #BaselineOf,
	#category : #BaselineOfHubitat
}

{ #category : #baseline }
BaselineOfHubitat >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'Hubitat' ]
]
