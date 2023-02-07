Class {
	#name : #HubitatLogParser,
	#superclass : #Object,
	#category : #Hubitat
}

{ #category : #accessing }
HubitatLogParser >> dateParser [
	^ ((#digit asPParser times: 4) flatten ==> [ :t | t asNumber ] , '-' asPParser
		, ((#digit asPParser times: 2) flatten ==> #asNumber) , '-' asPParser
		, ((#digit asPParser times: 2) flatten ==> #asNumber))
		==> [ :dateArray | 
			Date
				year: dateArray first
				month: dateArray third
				day: dateArray fifth ]
]

{ #category : #accessing }
HubitatLogParser >> descriptionParser [
	"How would capturing the parts of a source description work if just using separatedBy ?"

	^ ('|' asPParser negate plus flatten separatedBy: '|' asPParser)
		withoutSeparators
		==> [ :result | 
			Dictionary
				newFrom: {#eventSource -> (result at: 1).
						#sourceId -> (result at: 2).
						#sourceName -> (result at: 3).
						#sourceDescription -> (result at: 4).
						#wasDigital -> (self descriptionWasDigitalParser parse: (result at: 4)).
						#wasPhysical -> (self descriptionWasPhysicalParser parse: (result at: 4))} ]
]

{ #category : #accessing }
HubitatLogParser >> descriptionWasDigitalParser [
^ (#any asPParser starLazy , '[digital]' asPParser) ==> [:result | true]
]

{ #category : #accessing }
HubitatLogParser >> descriptionWasPhysicalParser [
^ (#any asPParser starLazy , '[physical]' asPParser) ==> [:result | true]
]

{ #category : #accessing }
HubitatLogParser >> improvedParse: aStream [
	^ self improvedParser parse: aStream
]

{ #category : #accessing }
HubitatLogParser >> improvedParser [
	| occurredAt date time logLevel logDescription |
	^ (self dateParser trim , self timeParser trim , self logLevelParser trim
		, self descriptionParser)
		==> [ :result | 
			date := result at: 1.
			time := result at: 2.
			logLevel := result at: 3.
			logDescription := result at: 4.

			occurredAt := DateAndTime
					basicYear: date year
					month: date monthIndex
					day: date dayOfMonth
					hour: (time at: #hour)
					minute: (time at: #minute)
					second: (time at: #second)
					nanoSecond: (time at: #millisecond) / 1000000
					offset: DateAndTime localOffset.
		self halt.
			HubitatDeviceEvent new
				occurredAt: occurredAt
				logLevel: logLevel
				sourceName: (logDescription at: #sourceName)
				sourceId: (logDescription at: #sourceId)
				sourceDescription: (logDescription at: #sourceDescription)
				eventSource: (logDescription at: #eventSource) ]
]

{ #category : #accessing }
HubitatLogParser >> logLevelParser [
	^ #letter asPParser plus flatten
]

{ #category : #accessing }
HubitatLogParser >> parse: aStream [
	^ self parser parse: aStream
]

{ #category : #accessing }
HubitatLogParser >> parser [
	^ (self dateParser trim , self timeParser trim , self logLevelParser trim
		, self descriptionParser)
		==> [ :result | 
			Dictionary
				newFrom: {#date -> (result at: 1).
						#time -> (result at: 2).
						#logLevel -> (result at: 3).
						#logDescription -> (result at: 4)} ]
]

{ #category : #accessing }
HubitatLogParser >> timeParser [
	^ ((#digit asPParser times: 2) flatten ==> #asNumber , ':' asPParser
		, ((#digit asPParser times: 2) flatten ==> #asNumber) , ':' asPParser
		, ((#digit asPParser times: 2) flatten ==> #asNumber) , '.' asPParser
		, ((#digit asPParser times: 3) flatten ==> #asNumber))
		==> [ :nodes | 
			Dictionary
				newFrom: {#hour -> (nodes at: 1).
						#minute -> (nodes at: 3).
						#second -> (nodes at: 5).
						#millisecond -> (nodes at: 7)} ]
]
