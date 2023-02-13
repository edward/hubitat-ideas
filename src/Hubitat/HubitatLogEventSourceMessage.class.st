Class {
	#name : #HubitatLogEventSourceMessage,
	#superclass : #Object,
	#instVars : [
		'message',
		'wasPhysical',
		'wasDigital'
	],
	#category : #Hubitat
}

{ #category : #accessing }
HubitatLogEventSourceMessage >> interactionType: anInteractionType [
	anInteractionType = #physical
		ifTrue: [ 
			wasPhysical := true.
			wasDigital := false ].

	anInteractionType = #digital
		ifTrue: [ 
			wasDigital := true.
			wasPhysical := false ]
]

{ #category : #accessing }
HubitatLogEventSourceMessage >> message [
	^ message
]

{ #category : #accessing }
HubitatLogEventSourceMessage >> message: anObject [
	message := anObject
]

{ #category : #accessing }
HubitatLogEventSourceMessage >> wasDigital [
	^ wasDigital
]

{ #category : #accessing }
HubitatLogEventSourceMessage >> wasDigital: anObject [
	wasDigital := anObject
]

{ #category : #accessing }
HubitatLogEventSourceMessage >> wasPhysical [
	^ wasPhysical
]

{ #category : #accessing }
HubitatLogEventSourceMessage >> wasPhysical: anObject [
	wasPhysical := anObject
]
