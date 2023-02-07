Class {
	#name : #Hubitat,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #Hubitat
}

{ #category : #accessing }
Hubitat >> logs [
	^ rawData collect: [:each | HubitatLogEntry new rawData: each]
]

{ #category : #accessing }
Hubitat >> rawData: someRawData [
	rawData := someRawData 
]
