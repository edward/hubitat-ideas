Class {
	#name : #HubitatLogParserExamples,
	#superclass : #Object,
	#category : #Hubitat
}

{ #category : #accessing }
HubitatLogParserExamples >> improvedParseTypicalLogLine [
	<gtExample>
	| parser result example_typical_log_line |
	parser := self parseEmptyString.
	example_typical_log_line := '2023-01-17 13:24:08.369	INFO 	app|354|L1 hall motion dim <span style=''color:red''>Restricted</span>|evt: 1F main hall motion sensor motion active --> restricted'.

	result := parser improvedParse: example_typical_log_line.

	self
		assert: result logLevel equals: 'INFO';
		assert: result occurredAt year equals: 2023;
		assert: result occurredAt monthIndex equals: 1;
		assert: result occurredAt dayOfMonth equals: 17;
		assert: result occurredAt hour equals: 13;
		assert: result occurredAt minute equals: 24;
		assert: result occurredAt second equals: 8;
		assert: result occurredAt nanoSecond equals: (369/1000000);
		assert: result sourceName equals: 'L1 hall motion dim <span style=''color:red''>Restricted</span>';
		assert: result sourceId equals: '354';
		assert: result sourceDescription equals: 'evt: 1F main hall motion sensor motion active --> restricted';
		assert: result eventSource equals: 'app'
	
]

{ #category : #accessing }
HubitatLogParserExamples >> parseEmptyString [
	<gtExample>
	| parser result |
	parser := self parserClass new.

	result := parser parse: ''.

	self assert: result class equals: PP2Failure.
	self assert: result message equals: 'digit expected'.

	^ parser
]

{ #category : #accessing }
HubitatLogParserExamples >> parseLogLineWithPhysicalInteraction [
	<gtExample>
	| parser result example_log_line |
	parser := self parseEmptyString.
	example_log_line := '2023-01-28 02:47:49.315	INFO 	dev|385|1F kitchen pendants|1F kitchen pendants was turned off [digital]'.

	result := parser improvedParse: example_log_line.


	self
		assert: result wasDigital equals: true.

	^ parser
]

{ #category : #accessing }
HubitatLogParserExamples >> parseTypicalLogLine [
	<gtExample>
	| parser result example_typical_log_line |
	parser := self parseEmptyString.
	example_typical_log_line := '2023-01-17 13:24:08.369	INFO 	app|354|L1 hall motion dim <span style=''color:red''>Restricted</span>|evt: 1F main hall motion sensor motion active --> restricted'.

	result := parser parse: example_typical_log_line.

	self
		assert: (result at: #logLevel) equals: 'INFO';
		assert: (result at: #date)
			equals: (Date
					year: 2023
					month: 1
					day: 17);
		assert: (result at: #time at: #hour) equals: 13;
		assert: (result at: #time at: #minute) equals: 24;
		assert: (result at: #time at: #second) equals: 8;
		assert: (result at: #time at: #millisecond) equals: 369;
		assert: (result at: #logDescription at: #sourceName)
			equals: 'L1 hall motion dim <span style=''color:red''>Restricted</span>';
		assert: (result at: #logDescription at: #sourceId) equals: '354';
		assert: (result at: #logDescription at: #sourceDescription)
			equals: 'evt: 1F main hall motion sensor motion active --> restricted';
		assert: (result at: #logDescription at: #eventSource) equals: 'app'.

	^ parser
]

{ #category : #accessing }
HubitatLogParserExamples >> parserClass [
	^ HubitatLogParser  
]
