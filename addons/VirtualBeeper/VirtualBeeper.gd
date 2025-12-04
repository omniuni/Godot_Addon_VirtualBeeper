extends Node

# Constants

const DEFAULT_BITRATE: int = 7350
const DEFAULT_BUFFER_SECONDS: float = 0.05
const DEFAULT_VOLUME: float = 0.8

# --- TONE_KEY Variables (C0 to B8) ---

# Octave 0
const TONE_KEY_C0: float = 16.35
const TONE_KEY_CSH0: float = 17.32
const TONE_KEY_D0: float = 18.35
const TONE_KEY_DSH0: float = 19.45
const TONE_KEY_E0: float = 20.59
const TONE_KEY_F0: float = 21.83
const TONE_KEY_FSH0: float = 23.12
const TONE_KEY_G0: float = 24.50
const TONE_KEY_GSH0: float = 25.96
const TONE_KEY_A0: float = 27.50
const TONE_KEY_ASH0: float = 29.14
const TONE_KEY_B0: float = 30.87

# Octave 1
const TONE_KEY_C1: float = 32.70
const TONE_KEY_CSH1: float = 34.65
const TONE_KEY_D1: float = 36.71
const TONE_KEY_DSH1: float = 38.89
const TONE_KEY_E1: float = 41.20
const TONE_KEY_F1: float = 43.65
const TONE_KEY_FSH1: float = 46.25
const TONE_KEY_G1: float = 49.00
const TONE_KEY_GSH1: float = 51.91
const TONE_KEY_A1: float = 55.00
const TONE_KEY_ASH1: float = 58.27
const TONE_KEY_B1: float = 61.74

# Octave 2
const TONE_KEY_C2: float = 65.41
const TONE_KEY_CSH2: float = 69.30
const TONE_KEY_D2: float = 73.42
const TONE_KEY_DSH2: float = 77.78
const TONE_KEY_E2: float = 82.41
const TONE_KEY_F2: float = 87.31
const TONE_KEY_FSH2: float = 92.50
const TONE_KEY_G2: float = 98.00
const TONE_KEY_GSH2: float = 103.83
const TONE_KEY_A2: float = 110.00
const TONE_KEY_ASH2: float = 116.54
const TONE_KEY_B2: float = 123.47

# Octave 3
const TONE_KEY_C3: float = 130.81
const TONE_KEY_CSH3: float = 138.59
const TONE_KEY_D3: float = 146.83
const TONE_KEY_DSH3: float = 155.56
const TONE_KEY_E3: float = 164.81
const TONE_KEY_F3: float = 174.61
const TONE_KEY_FSH3: float = 185.00
const TONE_KEY_G3: float = 196.00
const TONE_KEY_GSH3: float = 207.65
const TONE_KEY_A3: float = 220.00
const TONE_KEY_ASH3: float = 233.08
const TONE_KEY_B3: float = 246.94

# Octave 4 (Includes the reference A4)
const TONE_KEY_C4: float = 261.63
const TONE_KEY_CSH4: float = 277.18
const TONE_KEY_D4: float = 293.66
const TONE_KEY_DSH4: float = 311.13
const TONE_KEY_E4: float = 329.63
const TONE_KEY_F4: float = 349.23
const TONE_KEY_FSH4: float = 369.99
const TONE_KEY_G4: float = 392.00
const TONE_KEY_GSH4: float = 415.30
const TONE_KEY_A4: float = 440.00 # Reference A4
const TONE_KEY_ASH4: float = 466.16
const TONE_KEY_B4: float = 493.88

# Octave 5
const TONE_KEY_C5: float = 523.25
const TONE_KEY_CSH5: float = 554.37
const TONE_KEY_D5: float = 587.33
const TONE_KEY_DSH5: float = 622.25
const TONE_KEY_E5: float = 659.26
const TONE_KEY_F5: float = 698.46
const TONE_KEY_FSH5: float = 739.99
const TONE_KEY_G5: float = 783.99
const TONE_KEY_GSH5: float = 830.61
const TONE_KEY_A5: float = 880.00
const TONE_KEY_ASH5: float = 932.33
const TONE_KEY_B5: float = 987.77

# Octave 6
const TONE_KEY_C6: float = 1046.50
const TONE_KEY_CSH6: float = 1108.73
const TONE_KEY_D6: float = 1174.66
const TONE_KEY_DSH6: float = 1244.51
const TONE_KEY_E6: float = 1318.51
const TONE_KEY_F6: float = 1396.91
const TONE_KEY_FSH6: float = 1479.98
const TONE_KEY_G6: float = 1567.98
const TONE_KEY_GSH6: float = 1661.22
const TONE_KEY_A6: float = 1760.00
const TONE_KEY_ASH6: float = 1864.66
const TONE_KEY_B6: float = 1975.53

# Octave 7
const TONE_KEY_C7: float = 2093.00
const TONE_KEY_CSH7: float = 2217.46
const TONE_KEY_D7: float = 2349.32
const TONE_KEY_DSH7: float = 2489.02
const TONE_KEY_E7: float = 2637.02
const TONE_KEY_F7: float = 2793.83
const TONE_KEY_FSH7: float = 2959.96
const TONE_KEY_G7: float = 3135.96
const TONE_KEY_GSH7: float = 3322.44
const TONE_KEY_A7: float = 3520.00
const TONE_KEY_ASH7: float = 3729.31
const TONE_KEY_B7: float = 3951.07

# Octave 8 (Standard 88-key piano ends here)
const TONE_KEY_C8: float = 4186.01
const TONE_KEY_CSH8: float = 4434.92
const TONE_KEY_D8: float = 4698.64
const TONE_KEY_DSH8: float = 4978.03
const TONE_KEY_E8: float = 5274.04
const TONE_KEY_F8: float = 5587.65
const TONE_KEY_FSH8: float = 5919.91
const TONE_KEY_G8: float = 6271.93
const TONE_KEY_GSH8: float = 6644.88
const TONE_KEY_A8: float = 7040.00
const TONE_KEY_ASH8: float = 7458.62
const TONE_KEY_B8: float = 7902.13

# Private

static var _beeper_player: AudioStreamPlayer
static var _beeper_generator: AudioStreamGenerator

var _beeps_tracks: Dictionary[String, Array] = {}
var _beeps_queue: Dictionary[String, Array] = {}

var _process_lock: bool = false
var _generator_lock: bool = false

# Lifecycle
	
func _ready() -> void:
	
	if _beeper_player == null:
		
		print_debug("Setting up Virtual Beeper...")
		_beeper_player = AudioStreamPlayer.new()
		_beeper_generator = AudioStreamGenerator.new()
			
		_beeper_generator.mix_rate = DEFAULT_BITRATE
		_beeper_generator.buffer_length = DEFAULT_BUFFER_SECONDS
		_beeper_player.stream = _beeper_generator
		_beeper_player.autoplay = true
		
		add_child(_beeper_player)
		print_debug("Virtual Beeper Ready.")
		
	pass
	
func _process(_delta: float) -> void:
	if !_generator_lock and !_process_lock and !_beeps_tracks.keys().is_empty():
		_safe_start()
	pass
	
# Logic

# Clean up any tracks or beeps that are done and add new ones from the queue
func _safe_start() -> void:
	
	_process_lock = true
	
	for track_name in _beeps_tracks:
		for i in _beeps_tracks[track_name].size():
			var beep: VBeep = _beeps_tracks[track_name][i]
			if beep.frames_left < 1:
				_beeps_tracks[track_name].remove_at(i)
				
	for track_name in _beeps_queue:
		_beeps_tracks[track_name] = _beeps_queue[track_name]
	_beeps_queue.clear()
	
	_generate()
	
	pass


func _generate():
	_generator_lock = true
	
	var playback: AudioStreamGeneratorPlayback = _beeper_player.get_stream_playback()
	var frames_available: int = playback.get_frames_available()
	
	for frame_index: int in range(frames_available):
		var frame_vectors: Array[Vector2] = []
		for track_name: String in _beeps_tracks:
			if _beeps_tracks[track_name].size() > 0:
				var base_phase: float = _beeps_tracks[track_name][0].phase
				if _beeps_tracks[track_name][0].frames_left < 1:
					_beeps_tracks[track_name].remove_at(0)
					if _beeps_tracks[track_name].is_empty():
						_beeps_tracks.erase(track_name)
					if _beeps_tracks.has(track_name) and !_beeps_tracks[track_name].is_empty():
						_beeps_tracks[track_name][0].phase = base_phase
				if _beeps_tracks.has(track_name) and !_beeps_tracks[track_name].is_empty():
					var beep = _beeps_tracks[track_name][0]
					if beep.frames_left > 0:
						beep.phase = fmod(beep.phase + beep.increment, 1.0)
						beep.frames_left -= 1
						var beep_vector: Vector2 = Vector2.ONE * sin(beep.phase * TAU) * beep.volume
						frame_vectors.append(beep_vector)
		var frame_sum: Vector2 = Vector2.ZERO
		for vector in frame_vectors:
			frame_sum += vector
		var frame_vector = frame_sum / frame_vectors.size()
		playback.push_frame(frame_vector) 
	
	_generator_lock = false
	_process_lock = false
	pass
	
func _dynamic_track_name() -> String:
	return 'track_'+str(_beeps_tracks.keys().size())+'_'+str(Time.get_unix_time_from_system())

# Public

var incoming_beeps = []

func beep(beep: VBeep, track: String = '') -> void:
	var queue_track: String = track
	if queue_track == '':
		queue_track = _dynamic_track_name()
	_beeps_queue[queue_track] = [beep]
	_safe_start()
	pass

func play(beeps: Array[VBeep], track: String = '') -> void:
	var queue_track: String = track
	if queue_track == '':
		queue_track = _dynamic_track_name()
	_beeps_queue[queue_track] = beeps
	_safe_start()
	pass
	
func perform(beep_tracks: Dictionary) -> void:
	for key in beep_tracks.keys():
		_beeps_queue[key] = beep_tracks[key]
	_safe_start()
	pass
	
func lookup_note(note: String) -> float:
	var properties: Dictionary = self.get_script().get_script_constant_map()
	for key in properties.keys():
		if key.to_lower().find(note.to_lower()) > -1:
			return properties[key]
	return TONE_KEY_E4
	pass
