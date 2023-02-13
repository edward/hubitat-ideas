Class {
	#name : #HubitatLogEvent,
	#superclass : #Object,
	#instVars : [
		'timestamp',
		'logLevel',
		'eventType',
		'sourceId',
		'sourceName',
		'sourceDescription',
		'wasPhysical',
		'wasDigital'
	],
	#category : #Hubitat
}

{ #category : #accessing }
HubitatLogEvent >> eventType [
	^ eventType
]

{ #category : #accessing }
HubitatLogEvent >> eventType: anObject [
	eventType := anObject
]

{ #category : #accessing }
HubitatLogEvent >> logLevel [
	^ logLevel
]

{ #category : #accessing }
HubitatLogEvent >> logLevel: anObject [
	logLevel := anObject
]

{ #category : #accessing }
HubitatLogEvent >> sourceDescription [
	^ sourceDescription
]

{ #category : #accessing }
HubitatLogEvent >> sourceDescription: anObject [
	sourceDescription := anObject
]

{ #category : #accessing }
HubitatLogEvent >> sourceId [
	^ sourceId
]

{ #category : #accessing }
HubitatLogEvent >> sourceId: anObject [
	sourceId := anObject
]

{ #category : #accessing }
HubitatLogEvent >> sourceName [
	^ sourceName
]

{ #category : #accessing }
HubitatLogEvent >> sourceName: anObject [
	sourceName := anObject
]

{ #category : #accessing }
HubitatLogEvent >> timestamp [
	^ timestamp
]

{ #category : #accessing }
HubitatLogEvent >> timestamp: anObject [
	timestamp := anObject
]

{ #category : #accessing }
HubitatLogEvent >> wasDigital [
	^ wasDigital
]

{ #category : #accessing }
HubitatLogEvent >> wasDigital: anObject [
	wasDigital := anObject
]

{ #category : #accessing }
HubitatLogEvent >> wasPhysical [
	^ wasPhysical
]

{ #category : #accessing }
HubitatLogEvent >> wasPhysical: anObject [
	wasPhysical := anObject
]
