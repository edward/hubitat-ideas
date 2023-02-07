Class {
	#name : #HubitatLogEntry,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #Hubitat
}

{ #category : #accessing }
HubitatLogEntry >> rawData [
	^ rawData
]

{ #category : #accessing }
HubitatLogEntry >> rawData: someRawData [
	rawData := someRawData
]
