Object subclass: #MidiMessage
	instanceVariableNames: 'message'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!
!MidiMessage commentStamp: 'NickShaw 1/2/2018 14:39' prior: 0!
Generic MIDI message class.

Has a ByteArray message.

!


!MidiMessage methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 14:23'!
message
	^message ! !

!MidiMessage methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 14:23'!
message: aByteArray
	message := aByteArray ! !


MidiMessage subclass: #MidiChannelMessage
	instanceVariableNames: 'channel statusByte dataByte1 dataByte2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiChannelMessage methodsFor: 'initialization' stamp: 'NickShaw 1/2/2018 23:36'!
initialize
	message := ByteArray new: 3! !


!MidiChannelMessage methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 23:26'!
channel
	^channel ! !

!MidiChannelMessage methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 14:40'!
dataByte1
	^ dataByte1! !

!MidiChannelMessage methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 14:41'!
statusByte
	^ statusByte! !

!MidiChannelMessage methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 23:26'!
channel: aChannel
	channel := aChannel! !

!MidiChannelMessage methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 14:40'!
dataByte2
	^ dataByte2! !

!MidiChannelMessage methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 23:23'!
statusByte: aByte
	statusByte := aByte.
	message at: 1 put: statusByte ! !

!MidiChannelMessage methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 23:24'!
dataByte1: aByte
	dataByte1 := aByte.
	message at: 2 put: dataByte1  ! !

!MidiChannelMessage methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 23:25'!
dataByte2: aByte
	dataByte2 := aByte.
	message at: 3 put: dataByte2 ! !


Object subclass: #MidiNoteOnOffPair
	instanceVariableNames: 'noteOn noteOff'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!
!MidiNoteOnOffPair commentStamp: 'NickShaw 1/6/2018 14:41' prior: 0!
"Creates a pair of Note On and Note Off messages so you don't have to declare them individually and prevent stuck notes.."!


!MidiNoteOnOffPair methodsFor: 'accessing' stamp: 'NickShaw 1/6/2018 14:35'!
noteOn
	^ noteOn! !

!MidiNoteOnOffPair methodsFor: 'accessing' stamp: 'NickShaw 1/6/2018 14:35'!
noteOff
	^ noteOff! !


!MidiNoteOnOffPair methodsFor: 'instance creation' stamp: 'NickShaw 1/6/2018 14:31'!
channel: aChannel note: aNote velocity: aVelocity

	noteOn := MidiNoteOn new
		channel: aChannel
		note: aNote 
		velocity: aVelocity.
	noteOff := MidiNoteOff new 
		channel: aChannel 
		note: aNote
		velocity: 0 ! !


MidiMessage subclass: #MidiSystemMessage
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

MidiSystemMessage subclass: #MidiSystemCommon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

MidiSystemCommon subclass: #MidiSongPositionPointer
	instanceVariableNames: 'statusByte dataByte1 dataByte2 msb lsb'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiSongPositionPointer methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 06:21'!
initialize
	super initialize.
	self message: (ByteArray new: 3).
	self statusByte: 16rF2! !


!MidiSongPositionPointer methodsFor: 'as yet unclassified' stamp: 'NickShaw 1/3/2018 06:24'!
msb: aByte1 lsb: aByte2
	self msb: aByte1.
	self lsb: aByte2 ! !



!MidiSongPositionPointer methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:14'!
lsb
	^ lsb! !

!MidiSongPositionPointer methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:19'!
statusByte: aByte
	statusByte := aByte.
	self message at: 1put: statusByte ! !

!MidiSongPositionPointer methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:14'!
statusByte
	^ statusByte! !

!MidiSongPositionPointer methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:17'!
lsb: aByte
	lsb := aByte.
	self dataByte2: lsb! !

!MidiSongPositionPointer methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:14'!
dataByte1
	^ dataByte1! !

!MidiSongPositionPointer methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:22'!
dataByte1: aByte
	dataByte1 := aByte.
	self message at: 2 put: dataByte1 ! !

!MidiSongPositionPointer methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:14'!
msb
	^ msb! !

!MidiSongPositionPointer methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:22'!
dataByte2: aByte
	dataByte2 := aByte.
	self message at: 3 put: dataByte2 ! !

!MidiSongPositionPointer methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:17'!
msb: aByte
	msb := aByte.
	self dataByte1: msb! !

!MidiSongPositionPointer methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:14'!
dataByte2
	^ dataByte2! !


MidiSystemCommon subclass: #MidiSongSelect
	instanceVariableNames: 'statusByte dataByte1 song'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiSongSelect methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:26'!
dataByte1
	^ dataByte1! !

!MidiSongSelect methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:31'!
song
	^ song! !

!MidiSongSelect methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:26'!
statusByte
	^ statusByte! !

!MidiSongSelect methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:30'!
statusByte: aByte
	statusByte := aByte.
	self message at: 1 put: statusByte ! !

!MidiSongSelect methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:28'!
dataByte1: aByte
	dataByte1 := aByte.
	self message at: 1 put: dataByte1 ! !

!MidiSongSelect methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:33'!
song: aByte
	song := aByte.
	self dataByte1: song ! !


!MidiSongSelect methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 06:27'!
initialize
	super initialize.
	self message: (ByteArray new: 2).
	self statusByte: 16rF3! !


MidiSystemMessage subclass: #MidiSystemExclusive
	instanceVariableNames: 'startByte manufacturerID dataBytes endByte'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiSystemExclusive methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 12:35'!
endByte
	^ endByte! !

!MidiSystemExclusive methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 12:37'!
manufacturerID: aByteArray
	manufacturerID := aByteArray! !

!MidiSystemExclusive methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 12:38'!
dataBytes
	^ dataBytes! !

!MidiSystemExclusive methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 12:38'!
dataBytes: anObject
	dataBytes := anObject! !

!MidiSystemExclusive methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 12:35'!
startByte
	^ startByte! !


!MidiSystemExclusive methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 12:41'!
initialize
	startByte := 16rF0.
	endByte := 16rF7. ! !


!MidiSystemExclusive methodsFor: 'instance creation' stamp: 'NickShaw 1/3/2018 12:43'!
manufacturerID! !

!MidiSystemExclusive methodsFor: 'instance creation' stamp: 'NickShaw 1/3/2018 13:07'!
manufacturerID: idByteArray data: dataByteArray
	|sb eb|
	sb := startByte asByteArray.
	eb := endByte asByteArray.
	"Creates a new ByteArray of composed of start byte, end byte id and data bytes"
	message := (ByteArray new: (2 + (idByteArray size) + (dataByteArray size))).
	"concatenate ByteArrays"
	self message: sb, idByteArray, dataByteArray, eb
	! !


MidiSystemMessage subclass: #MidiSystemRealtime
	instanceVariableNames: 'statusByte'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiSystemRealtime methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 04:07'!
initialize
	super initialize.
	self message: (ByteArray new: 1) ! !


!MidiSystemRealtime methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 04:09'!
statusByte
	^ statusByte! !

!MidiSystemRealtime methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 04:09'!
statusByte: aByte
	statusByte := aByte! !


MidiSystemRealtime subclass: #MidiActiveSensing
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiActiveSensing methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 04:20'!
initialize
	super initialize.
	self statusByte: 16rFE! !


MidiSystemRealtime subclass: #MidiContinueSequence
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiContinueSequence methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 04:13'!
initialize
	super initialize.
	self statusByte: 16rFB! !


MidiSystemRealtime subclass: #MidiStartSequence
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiStartSequence methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 04:13'!
initialize
	super initialize.
	self statusByte: 16rFA! !


MidiSystemRealtime subclass: #MidiStopSequence
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiStopSequence methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 04:14'!
initialize
	super initialize.
	self statusByte: 16rFC! !


MidiSystemRealtime subclass: #MidiSystemReset
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiSystemReset methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 04:20'!
initialize
	super initialize.
	self statusByte: 16rFF! !


MidiSystemRealtime subclass: #MidiTimingClock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiTimingClock methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 05:41'!
initialize
	super initialize.
	self statusByte: 16rF8! !


MidiSystemCommon subclass: #MidiTimingCodeQuarterFrame
	instanceVariableNames: 'statusByte dataByte1 idNibble timeCodeNibble'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiTimingCodeQuarterFrame methodsFor: 'instance creation' stamp: 'NickShaw 1/3/2018 05:59'!
idNibble: aNibble1 timeCodeNibble: aNibble2
	self idNibble: aNibble1 .
	self timeCodeNibble: aNibble2 .
	self dataByte1: (idNibble << 7)+timeCodeNibble  
	! !


!MidiTimingCodeQuarterFrame methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 05:50'!
idNibble
	^ idNibble! !

!MidiTimingCodeQuarterFrame methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 05:53'!
timeCodeNibble
	^ timeCodeNibble! !

!MidiTimingCodeQuarterFrame methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 05:43'!
dataByte1
	^ dataByte1! !

!MidiTimingCodeQuarterFrame methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 05:53'!
timeCodeNibble: aNibble
	timeCodeNibble := aNibble! !

!MidiTimingCodeQuarterFrame methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 05:43'!
statusByte
	^ statusByte! !

!MidiTimingCodeQuarterFrame methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 05:46'!
statusByte: aByte
	statusByte := aByte.
	self message at: 1 put: statusByte ! !

!MidiTimingCodeQuarterFrame methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 05:50'!
idNibble: aNibble
	idNibble := aNibble! !

!MidiTimingCodeQuarterFrame methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:03'!
dataByte1: aByte
	dataByte1 := aByte.
	self message at: 2 put: dataByte1  ! !


!MidiTimingCodeQuarterFrame methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 05:44'!
initialize
	super initialize.
	self message: (ByteArray new: 2).
	self statusByte: 16rF1! !


MidiSystemCommon subclass: #MidiTuneRequest
	instanceVariableNames: 'statusByte'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiTuneRequest methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:35'!
statusByte
	^ statusByte! !

!MidiTuneRequest methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 06:35'!
statusByte: aByte
	statusByte := aByte.
	self message at: 1 put: statusByte ! !


!MidiTuneRequest methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 06:34'!
initialize
	super initialize.
	self message: (ByteArray new: 1).
	self statusByte: 16rF6! !


MidiChannelMessage subclass: #MidiVoiceMessage
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!


MidiVoiceMessage subclass: #MidiChannelPressure
	instanceVariableNames: 'pressure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiChannelPressure methodsFor: 'instance creation' stamp: 'NickShaw 1/3/2018 01:37'!
channel: aChannel pressure: aPressure
	self channel: aChannel.
	self pressure: aPressure.
	! !


!MidiChannelPressure methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 01:28'!
pressure: aPressure
	pressure := aPressure.
	self dataByte1: pressure! !

!MidiChannelPressure methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 01:35'!
pressure
	^ pressure! !

!MidiChannelPressure methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 01:29'!
channel: aChannel
	channel := aChannel.
	self statusByte: channel! !

!MidiChannelPressure methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 01:30'!
statusByte: aChannel
	statusByte := 16rD0 bitOr: aChannel - 1.
	super statusByte: statusByte! !


!MidiChannelPressure methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 01:25'!
initialize
	super initialize.
	self dataByte2: 0! !


MidiVoiceMessage subclass: #MidiControlChange
	instanceVariableNames: 'controller controlValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiControlChange methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 00:21'!
controlValue
	^ controlValue! !

!MidiControlChange methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 00:23'!
channel: aChannel
	channel := aChannel.
	self statusByte: channel! !

!MidiControlChange methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 00:21'!
controller
	^ controller! !

!MidiControlChange methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 00:24'!
statusByte: aChannel
	statusByte := 16rB0 bitOr: aChannel - 1.
	super statusByte: statusByte! !

!MidiControlChange methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 00:29'!
controller: aController
	controller := aController.
	self dataByte1: controller ! !

!MidiControlChange methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 00:38'!
controlValue: aValue
	controlValue := aValue.
	 self dataByte2: controlValue! !


!MidiControlChange methodsFor: 'instance creation' stamp: 'NickShaw 1/3/2018 00:27'!
channel: aChannel controller: aController controlValue: aControlValue
	self channel: aChannel.
	self controller: aController.
	self controlValue: aControlValue ! !


MidiControlChange subclass: #MidiAllNotesOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiAllNotesOff methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 03:22'!
channel: aChannel
	channel := aChannel.
	self statusByte: channel! !


!MidiAllNotesOff methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 03:22'!
initialize
	super initialize.
	self dataByte1: 16r7B.
	self dataByte1: 0! !


MidiControlChange subclass: #MidiLocalControlOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiLocalControlOff methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 03:18'!
initialize
	super initialize.
	self dataByte1: 16r7A.
	self dataByte1: 0! !


!MidiLocalControlOff methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 03:17'!
channel: aChannel
	channel := aChannel.
	self statusByte: channel! !


MidiControlChange subclass: #MidiLocalControlOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiLocalControlOn methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 03:19'!
channel: aChannel
	channel := aChannel.
	self statusByte: channel! !


!MidiLocalControlOn methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 03:20'!
initialize
	super initialize.
	self dataByte1: 16r7A.
	self dataByte1: 127! !


MidiControlChange subclass: #MidiMonoModeOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiMonoModeOn methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 03:38'!
initialize
	super initialize.
	self dataByte1: 16r7E.
	self dataByte1: 0! !


!MidiMonoModeOn methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 03:38'!
channel: aChannel
	channel := aChannel.
	self statusByte: channel! !


MidiVoiceMessage subclass: #MidiNoteOff
	instanceVariableNames: 'note velocity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiNoteOff methodsFor: 'instance creation' stamp: 'NickShaw 1/2/2018 23:16'!
channel: aChannel note: aNote velocity: aVelocity
	self channel: aChannel.
	self note: aNote.
	self velocity: aVelocity.
	! !


!MidiNoteOff methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 14:48'!
velocity
	^ velocity! !

!MidiNoteOff methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 23:13'!
note: aNote
	note := aNote.
	self dataByte1: note.! !

!MidiNoteOff methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 23:48'!
channel: aChannel
	channel := aChannel .
	self statusByte: channel! !

!MidiNoteOff methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 14:47'!
note
	^ note! !

!MidiNoteOff methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 23:40'!
statusByte: aChannel
	statusByte := 16r80 bitOr: aChannel - 1.
	super statusByte: statusByte ! !

!MidiNoteOff methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 23:51'!
velocity: aVelocity
	velocity := aVelocity.
	self dataByte2: velocity! !


MidiVoiceMessage subclass: #MidiNoteOn
	instanceVariableNames: 'note velocity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiNoteOn methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 14:48'!
velocity
	^ velocity! !

!MidiNoteOn methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 23:57'!
channel: aChannel note: aNote velocity: aVelocity
	self channel: aChannel.
	self note: aNote.
	self velocity: aVelocity! !

!MidiNoteOn methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 00:02'!
note: aNote
	note := aNote.
	self dataByte1: note! !

!MidiNoteOn methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 23:57'!
channel: aChannel
	channel := aChannel.
	self statusByte: channel! !

!MidiNoteOn methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 14:48'!
note
	^ note! !

!MidiNoteOn methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 00:03'!
velocity: aVelocity
	velocity := aVelocity.
	self dataByte2: velocity! !

!MidiNoteOn methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 00:04'!
statusByte: aChannel
	statusByte := 16r90 bitOr: aChannel - 1.
	super statusByte: statusByte! !


MidiControlChange subclass: #MidiOmniModeOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiOmniModeOff methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 03:32'!
channel: aChannel
	channel := aChannel.
	self statusByte: channel! !


!MidiOmniModeOff methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 03:33'!
initialize
	super initialize.
	self dataByte1: 16r7C.
	self dataByte1: 0! !


MidiControlChange subclass: #MidiOmniModeOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiOmniModeOn methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 03:35'!
initialize
	super initialize.
	self dataByte1: 16r7D.
	self dataByte1: 0! !


!MidiOmniModeOn methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 03:34'!
channel: aChannel
	channel := aChannel.
	self statusByte: channel! !


MidiVoiceMessage subclass: #MidiPitchBend
	instanceVariableNames: 'msb lsb'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiPitchBend methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 01:56'!
lsb
	^ lsb! !

!MidiPitchBend methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 01:59'!
channel: aChannel
	channel := aChannel.
	self statusByte: channel! !

!MidiPitchBend methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 01:57'!
msb
	^ msb! !

!MidiPitchBend methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 01:58'!
statusByte: aChannel
	statusByte := 16rE0 bitOr: aChannel - 1.
	super statusByte: statusByte! !

!MidiPitchBend methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 02:01'!
lsb: aByte
	lsb := aByte.
	self dataByte2: lsb! !

!MidiPitchBend methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 02:39'!
msb: aByte
	msb := aByte.
	self dataByte1: msb! !


!MidiPitchBend methodsFor: 'instance creation' stamp: 'NickShaw 1/3/2018 02:36'!
channel: aChannel pitchbend: aBend
	self channel: aChannel.
	self msb: aBend >> 7.
	self lsb: aBend -(msb << 7)
	! !

!MidiPitchBend methodsFor: 'instance creation' stamp: 'NickShaw 1/3/2018 01:52'!
channel: aChannel msb: aByte lsb: aByte2
	self channel: aChannel.
	self msb: aByte.
	self lsb: aByte2.
	! !


MidiControlChange subclass: #MidiPolyModeOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiPolyModeOn methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 03:42'!
initialize
	super initialize.
	self dataByte1: 16r7F.
	self dataByte1: 0! !


!MidiPolyModeOn methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 03:42'!
channel: aChannel
	channel := aChannel.
	self statusByte: channel! !


MidiVoiceMessage subclass: #MidiPolyPressure
	instanceVariableNames: 'note pressure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiPolyPressure methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 00:11'!
pressure: aPressure
	pressure  := aPressure.
	self dataByte2: pressure ! !

!MidiPolyPressure methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 14:51'!
pressure
	^ pressure! !

!MidiPolyPressure methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 00:09'!
note: aNote
	note := aNote.
	self dataByte1: note! !

!MidiPolyPressure methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 00:34'!
channel: aChannel
	channel := aChannel.
	self statusByte: channel! !

!MidiPolyPressure methodsFor: 'accessing' stamp: 'NickShaw 1/2/2018 14:51'!
note
	^ note! !

!MidiPolyPressure methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 00:12'!
statusByte: aChannel
	statusByte := 16rA0 bitOr: aChannel - 1.
	super statusByte: statusByte! !


!MidiPolyPressure methodsFor: 'instance creation' stamp: 'NickShaw 1/3/2018 00:09'!
channel: aChannel note: aNote pressure: aPressure
	self channel: aChannel.
	self note: aNote.
	self pressure: aPressure ! !


MidiVoiceMessage subclass: #MidiProgramChange
	instanceVariableNames: 'program'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiProgramChange methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 01:05'!
initialize
	super initialize .
	self dataByte2: 0! !


!MidiProgramChange methodsFor: 'instance creation' stamp: 'NickShaw 1/3/2018 00:59'!
channel: aChannel program: programNumber
	self channel: aChannel.
	self program: programNumber 
	! !


!MidiProgramChange methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 01:03'!
program: programNumber
	program := programNumber.
	self dataByte1: program ! !

!MidiProgramChange methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 00:56'!
channel: aChannel
	channel := aChannel.
	self statusByte: channel! !

!MidiProgramChange methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 01:00'!
statusByte: aChannel
	statusByte := 16rC0 bitOr: aChannel - 1.
	super statusByte: statusByte! !

!MidiProgramChange methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 01:03'!
program
	^ program! !


MidiControlChange subclass: #MidiResetAllControllers
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Midi-Messages'!

!MidiResetAllControllers methodsFor: 'accessing' stamp: 'NickShaw 1/3/2018 03:14'!
channel: aChannel
	channel := aChannel.
	self statusByte: channel! !


!MidiResetAllControllers methodsFor: 'initialization' stamp: 'NickShaw 1/3/2018 03:16'!
initialize
	super initialize.
	self dataByte1: 16r79.
	self dataByte1: 0! !
