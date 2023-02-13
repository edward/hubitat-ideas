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
	| logEvent |
	^ (timestamp trim , logLevel trim , sourceType , '|' asPParser , sourceId
		, '|' asPParser , sourceName , '|' asPParser , sourceMessage)
		==> [ :nodes | 
			logEvent := HubitatLogEvent new
					timestamp: (nodes at: 1);
					logLevel: (nodes at: 2);
					eventType: (nodes at: 3);
					sourceId: (nodes at: 5);
					sourceName: (nodes at: 7);
					sourceDescription: (nodes at: 9) message;
					wasDigital: (nodes at: 9) wasDigital;
					wasPhysical: (nodes at: 9) wasPhysical ]
]

{ #category : #accessing }
HubitatLogParser2 >> sourceId [
	^ #digit asPParser plus flatten
]

{ #category : #accessing }
HubitatLogParser2 >> sourceMessage [
	"Are digital events important?"

	| eventSourceMessage |
	^ (#any asPParser starLazy trim flatten, 
		(
			('[digital]' asPParser ==> [ :_nodes | #digital ]) /
			('[physical]' asPParser==> [ :_nodes | #physical ])
		)
	) ==> [ :nodes | 
			nodes size = 2
				ifTrue: [ eventSourceMessage := HubitatLogEventSourceMessage new
							message: (nodes at: 1);
							interactionType: (nodes at: 2) ] ]
]

{ #category : #accessing }
HubitatLogParser2 >> sourceName [
	^ #any asPParser starLazy flatten
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

	^ ((#digit asPParser times: 4) flatten , '-' asPParser
		, (#digit asPParser times: 2) flatten , '-' asPParser
		, (#digit asPParser times: 2) flatten , ' ' asPParser
		, (#digit asPParser times: 2) flatten , ':' asPParser
		, (#digit asPParser times: 2) flatten , ':' asPParser
		, (#digit asPParser times: 2) flatten , '.' asPParser
		, (#digit asPParser times: 3) flatten)
		==> [ :nodes | 
			DateAndTime
				year: (nodes at: 1) asNumber
				month: (nodes at: 3) asNumber
				day: (nodes at: 5) asNumber
				hour: (nodes at: 7) asNumber
				minute: (nodes at: 9) asNumber
				second: (nodes at: 11) asNumber
				nanoSecond: (nodes at: 13) asNumber * 1000000
				offset: DateAndTime localOffset ]
]
