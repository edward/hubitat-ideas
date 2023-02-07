Class {
	#name : #HubitatLogParser2Examples,
	#superclass : #PP2CompositeNodeExamples,
	#category : #Hubitat
}

{ #category : #accessing }
HubitatLogParser2Examples >> aDigitalSourceMessageParsed [
	<gtExample>
	self parse: 'Some message that ends with [digital]' rule: #sourceMessage.
	
	^ self anEmptyExample
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
	self parse: '2023-01-28 02:07:02.546\tINFO \tdev|65|1F main hall dimmer|1F main hall dimmer was turned on [physical]' rule: #logLine.
	
	^ self anEmptyExample.
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
	| timestamp parser |
	timestamp := '2023-01-28 02:47:49.315'.

	"Not actually used since it’s not how this assertion is designed"
	"How does the example-based approach work here?"
	parser := self anEmptyExample.

	self parse: timestamp rule: #timestamp.

	^ parser
]

{ #category : #accessing }
HubitatLogParser2Examples >> aValidParse [
	<gtExample>
	self parse: '2023-01-28 02:07:02.546\tINFO \tdev|65|1F main hall dimmer|1F main hall dimmer was turned on [physical]'.
	
	^ self anEmptyExample.
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
