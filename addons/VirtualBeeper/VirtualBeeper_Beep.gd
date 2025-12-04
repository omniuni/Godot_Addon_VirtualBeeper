class_name VBeep
extends Node

var _tone_hz: float = VirtualBeeper.TONE_KEY_A4
var _sample_rate: float = VirtualBeeper.DEFAULT_BITRATE
var volume: float = VirtualBeeper.DEFAULT_VOLUME
var frames_left: int = VirtualBeeper.DEFAULT_BITRATE/4 # Half a second based on the bitrate.
var phase: float = 0.0

var increment: float = 0:
	get:
		return _tone_hz / _sample_rate

func _init(sample_rate: int = VirtualBeeper.DEFAULT_BITRATE) -> void:
	_sample_rate = sample_rate
	pass
	
func for_seconds(time_in_seconds: float = 0.5) -> VBeep:
	frames_left = int(time_in_seconds * _sample_rate/2)
	return self
	
func at(tone_hz: float, target_volume: float = VirtualBeeper.DEFAULT_VOLUME) -> VBeep:
	_tone_hz = tone_hz
	volume = target_volume
	return self
	
func at_volume(target_volume: float) -> VBeep:
	volume = target_volume
	return self
