Class {
	#name : #HubitatLogEvents,
	#superclass : #Object,
	#instVars : [
		'logEvents'
	],
	#category : #Hubitat
}

{ #category : #accessing }
HubitatLogEvents >> gtLogEventsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Hubitat log events';
		items: [ self logEvents ];
		column: 'Timestamp' text: [ :each | each timestamp asLocalStringYMDHM ];
		column: 'Type' text: #eventType;
		column: 'Log level' text: #logLevel;
		column: 'Source description' text: #sourceDescription;
		column: 'Source ID' text: #sourceId;
		column: 'Source name' text: #sourceName;
		column: 'Was a physical interaction' text: #wasPhysical
]

{ #category : #accessing }
HubitatLogEvents >> logEvents [
	^ logEvents
]

{ #category : #accessing }
HubitatLogEvents >> logEvents: anObject [
	logEvents := anObject
]
