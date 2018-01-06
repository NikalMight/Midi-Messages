# Midi-Messages

MIDI Messages for Pharo Smalltalk

## Summary

A set of classes that represent MIDI messages. I haven't implemented Universal SysEx messages or Midi Machine Control. I may do if I find a need to, but the most useful messages have already been implemented. There are a few 'missing link' classes that don't really do anything other than provide structure in the class hierarchy. Don't instantiate them. Use the subclasses instead.

## Class Hierarchy

- MidiMessage
  - MidiChannelMessage
    - MidiVoiceMessage
      - MidiChannelPressure
      - MidiControlChange
        - MidiAllNotesOff
        - MidiLocalControlOff
        - MidiLocalControlOn
        - MidiMonoModeOn
        - MidiOmniModeOff
        - MidiOmniModeOn
        - MidiPolyModeOn
        - MidiResetAllControllers
      - MidiNoteOff
      - MidiNoteOn
      - MidiPitchBend
      - MidiPolyPressure
      - MidiProgramChange
  - MidiSystemMessage
    - MidiSystemCommon
      - MidiSongPositionPointer
      - MidiSongSelect
      - MidiTimingCodeQuarterFrame
      - MidiTuneRequest
    - MidiSystemExclusive
    - MidiSystemRealtime
      - MidiActiveSensing
      - MidiContinueSequence
      - MidiStartSequence
      - MidiStopSequence
      - MidiSystemReset
      - MidiTimingClock

## Usage

You can set the status and data bytes manually, but it's better to use the method in the instance creation protocol, which uses setters more appropriate to the function of the class.

Example usage-

```smalltalk

    | noteOn |
    noteOn := MidiNoteOn new
      channel: 1
      note: 64
      velocity: 127.
```

This will create a new Note On message which will set the status byte and data bytes 1 and 2 and will store them in a ByteArray called message(contained in the MidiMessage superclass).
You can then send the message to your MIDI port eg if you're using the SimpleMIDIPort class from the SoundScores package, you would use

```smalltalk
    | aPort|
    aPort := SimpleMidiPort new
      openOnPortNumber: 1;
      midiOutput: noteOn message.
```