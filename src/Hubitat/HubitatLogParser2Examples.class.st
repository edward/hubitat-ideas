Class {
	#name : #HubitatLogParser2Examples,
	#superclass : #PP2CompositeNodeExamples,
	#category : #Hubitat
}

{ #category : #accessing }
HubitatLogParser2Examples >> aDigitalSourceMessageParsed [
	<gtExample>
	| logEvent parser aValidDigitalSourceMessage |
	aValidDigitalSourceMessage := 'Some very digital message that ends with [digital]'.
	
	self parse: aValidDigitalSourceMessage rule: #sourceMessage.

	parser := self parserInstance sourceMessage.
	logEvent := parser parse: aValidDigitalSourceMessage.
	self assert: [ logEvent wasDigital ].

	^ parser
]

{ #category : #accessing }
HubitatLogParser2Examples >> aFailingParseForAValidButNotDigitalOrPhysicalEvent [
	<gtExample>
	self fail: self aValidInputWithoutPhysicalOrDigitalTag rule: #start.
	
	^ self anEmptyExample.
]

{ #category : #accessing }
HubitatLogParser2Examples >> aLogLevel [
	<gtExample>
	self parse: 'INFO' rule: #logLevel.
	
	^ self anEmptyExample.
]

{ #category : #accessing }
HubitatLogParser2Examples >> aLogLineParsed [
	<gtExample>
	| aHubitatDeviceEvent parser |
	self parse: (self aValidInputWithPhysicalTag) rule: #logLine.
	
	"I want to start using HubitatDeviceEvent"
	parser := self parserInstance.
	aHubitatDeviceEvent := parser parse: (self aValidInputWithPhysicalTag).
	
	"Should return a valid log line event object"

	self assert: aHubitatDeviceEvent logLevel equals: 'INFO';
	 assert: aHubitatDeviceEvent eventType equals: 'dev';
	 assert: aHubitatDeviceEvent sourceDescription equals: '1F main hall dimmer was turned on ';
	 assert: aHubitatDeviceEvent sourceId equals: '65';
	  assert: aHubitatDeviceEvent sourceName equals: '1F main hall dimmer';
	  assert: aHubitatDeviceEvent wasPhysical equals: true.

	^ parser.
]

{ #category : #accessing }
HubitatLogParser2Examples >> aPhysicalSourceMessageParsed [
	<gtExample>
	self parse: 'Some message that ends with [physical]' rule: #sourceMessage.
	
	^ self anEmptyExample
]

{ #category : #accessing }
HubitatLogParser2Examples >> aSourceId [
	<gtExample>
	self parse: '12' rule: #sourceId.
	
	^ self anEmptyExample.
]

{ #category : #accessing }
HubitatLogParser2Examples >> aSourceMessageParsed [
	<gtExample>
	self parse: 'Some message that ends with [physical]' rule: #sourceMessage.
	
	^ self anEmptyExample
]

{ #category : #accessing }
HubitatLogParser2Examples >> aSourceName [
	<gtExample>
	self parse: 'A lovely name of a source that might be a device or application' rule: #sourceName.
	
	^ self anEmptyExample.
]

{ #category : #accessing }
HubitatLogParser2Examples >> aTimestampParsed [
	<gtExample>
	| aValidTimestamp parser expectedTimestamp parsedTimestamp timeZoneOffsetSegment localTimeZoneOffset |
	aValidTimestamp := '2023-01-28 02:47:49.315'.	
	
	parser := self anEmptyExample timestamp.

	self parse: aValidTimestamp rule: #timestamp.

	"It would be really nice to be able to set time and freeze it for the scope of a block"
	"to avoid this custom string formatting code."
	"See https://github.com/travisjeffery/timecop for more details"
	localTimeZoneOffset := DateAndTime localOffset.
	timeZoneOffsetSegment := String
			streamContents: [ :string | 
				string
					nextPut: (localTimeZoneOffset positive ifTrue: [ $+ ] ifFalse: [ $- ]);
					nextPutAll: localTimeZoneOffset hours abs asTwoCharacterString;
					nextPutAll: ':';
					nextPutAll: localTimeZoneOffset minutes asTwoCharacterString ].

	expectedTimestamp := '2023-01-28T02:47:49.315', timeZoneOffsetSegment.

	parsedTimestamp := parser parse: aValidTimestamp.

	self assert: parsedTimestamp printString equals: expectedTimestamp.

	^ parser
]

{ #category : #accessing }
HubitatLogParser2Examples >> aValidInputWithDigitalTag [
	^ '2023-01-28 02:47:52.283	INFO 	dev|65|1F main hall dimmer|1F main hall dimmer was turned on [digital]'
]

{ #category : #accessing }
HubitatLogParser2Examples >> aValidInputWithPhysicalTag [
	^ '2023-01-28 02:47:52.283	INFO 	dev|65|1F main hall dimmer|1F main hall dimmer was turned on [physical]'
]

{ #category : #accessing }
HubitatLogParser2Examples >> aValidInputWithoutPhysicalOrDigitalTag [
	^ '2023-01-28 02:00:00.439	INFO 	app|552|2F winder stair motion app|Mode change to 6 Evening (late)'
]

{ #category : #accessing }
HubitatLogParser2Examples >> anEmptyExample [
	<gtExample>
	| parser |
	parser := self parserInstance.

	self fail: '' rule: #logLine.

	^ parser
]

{ #category : #accessing }
HubitatLogParser2Examples >> parserClass [
	^ HubitatLogParser2
]
