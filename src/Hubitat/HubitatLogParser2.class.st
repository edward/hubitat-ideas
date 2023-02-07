Class {
	#name : #HubitatLogParser2,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'timestamp',
		'logLevel',
		'sourceType',
		'sourceId',
		'sourceMessage',
		'sourceName',
		'logLine'
	],
	#category : #Hubitat
}

{ #category : #accessing }
HubitatLogParser2 >> logLevel [
^ #letter asPParser plus flatten
]

{ #category : #accessing }
HubitatLogParser2 >> logLine [
	"Should >>trim be updated to also consume tabs?"

	^ timestamp trim, '\t' asPParser, logLevel trim, '\t' asPParser, sourceType , '|' asPParser, sourceId , '|' asPParser, sourceName , '|' asPParser, sourceMessage end
]

{ #category : #accessing }
HubitatLogParser2 >> sourceId [
	^ #digit asPParser plus flatten
]

{ #category : #accessing }
HubitatLogParser2 >> sourceMessage [
	"Are digital events important?"

	^ #any asPParser starLazy, ('[digital]' asPParser / '[physical]' asPParser)
]

{ #category : #accessing }
HubitatLogParser2 >> sourceName [
	^ #any asPParser starLazy
]

{ #category : #accessing }
HubitatLogParser2 >> sourceType [
	^ #letter asPParser plus flatten
]

{ #category : #accessing }
HubitatLogParser2 >> start [
	^ logLine
]

{ #category : #accessing }
HubitatLogParser2 >> timestamp [
	"Answer a parser for strings like: 2023-01-28 02:47:49.315"

	^ (#digit asPParser times: 4) , '-' asPParser , (#digit asPParser times: 2)
		, '-' asPParser , (#digit asPParser times: 2) , ' ' asPParser
		, (#digit asPParser times: 2) , ':' asPParser , (#digit asPParser times: 2)
		, ':' asPParser , (#digit asPParser times: 2) , '.' asPParser
		, (#digit asPParser times: 3)
]
