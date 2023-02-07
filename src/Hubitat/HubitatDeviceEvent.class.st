Class {
	#name : #HubitatDeviceEvent,
	#superclass : #Object,
	#instVars : [
		'occurredAt',
		'logLevel',
		'sourceName',
		'sourceId',
		'sourceDescription',
		'eventSource',
		'wasDigital',
		'wasPhysical'
	],
	#category : #Hubitat
}

{ #category : #accessing }
HubitatDeviceEvent >> eventSource [
	^ eventSource
]

{ #category : #accessing }
HubitatDeviceEvent >> logLevel [
	^ logLevel
]

{ #category : #accessing }
HubitatDeviceEvent >> occurredAt [
	^ occurredAt
]

{ #category : #accessing }
HubitatDeviceEvent >> occurredAt: anOccurredAt logLevel: aLogLevel sourceName: aSourceName sourceId: aSourceId sourceDescription: aSourceDescription
eventSource: anEventSource [
	occurredAt := anOccurredAt.
	logLevel := aLogLevel.
	sourceName := aSourceName.
	sourceId := aSourceId.
	sourceDescription := aSourceDescription.
	eventSource := anEventSource
]

{ #category : #accessing }
HubitatDeviceEvent >> sourceDescription [
	^ sourceDescription
]

{ #category : #accessing }
HubitatDeviceEvent >> sourceId [
	^ sourceId
]

{ #category : #accessing }
HubitatDeviceEvent >> sourceName [
	^ sourceName
]

{ #category : #accessing }
HubitatDeviceEvent >> wasDigital [
	^ wasDigital
]

{ #category : #accessing }
HubitatDeviceEvent >> wasPhysical [
	^ wasPhysical
]
