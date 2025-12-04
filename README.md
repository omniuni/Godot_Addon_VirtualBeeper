# What is VirtualBeeper?

Most simply, VirtualBeeper is a Godot 4.5+ addon for easily adding beeps to your game.
However, there's a little more under the hood.

 - Extremely small, no audio files are included
 - Written in GDScript, so it works with export to browsers
 - Does not require a node to be added to your scene
 - Includes common musical notes as frequencies
 - Can play sequences of beeps
 - Can play arbitrary amounts of beeps at once

# Using VirtualBeeper

 1. Add `VirtualBeeper.gd` as a global
 2. Use it. It's that simple.
 
## Basic Usage

To emit a beep, you pass a new `VBeep` object to the beeper:

	func _on_button_simple_pressed() -> void:
		VirtualBeeper.beep(VBeep.new())
	pass
	
This will emit the default beep; half a second of reference note A4 at 440 Hz.
