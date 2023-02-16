Class {
	#name : #Hubitat3DeviceEvents,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #Hubitat
}

{ #category : #accessing }
Hubitat3DeviceEvents >> gtDeviceEventsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Device events';
		items: [ self rawData at: 'data' ];
		column: 'Timestamp'
			text: [ :each | (each at: 8) asRopedText background: Color paleYellow ]
]

{ #category : #accessing }
Hubitat3DeviceEvents >> rawData [
	^ rawData
]

{ #category : #accessing }
Hubitat3DeviceEvents >> rawData: anObject [
	rawData := anObject
]
