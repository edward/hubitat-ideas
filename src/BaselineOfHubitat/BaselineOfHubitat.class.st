Class {
	#name : #BaselineOfHubitat,
	#superclass : #BaselineOf,
	#category : #BaselineOfHubitat
}

{ #category : #accessing }
BaselineOfHubitat class >> loadLepiter [
	| currentProperties |
	currentProperties := LeDatabasesRegistry defaultLogicalDatabase properties.
	currentProperties
		addRegisteredDirectory: FileLocator imageDirectory / 'pharo-local' / 'iceberg' / 'edward'
				/ 'hubitat-ideas' / 'lepiter'.
	LeDatabasesRegistry default defaultLogicalDatabase reload
]

{ #category : #baseline }
BaselineOfHubitat >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'Hubitat' ]
]
