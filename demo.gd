extends Control


func _on_button_mamma_pressed() -> void:
	VirtualBeeper.play([
		VBeep.new().for_seconds(0.5).at(VirtualBeeper.lookup_note('D4')),
		VBeep.new().for_seconds(0.5).at(VirtualBeeper.lookup_note('E4')),
		VBeep.new().for_seconds(0.5).at(VirtualBeeper.lookup_note('F4')),
		VBeep.new().for_seconds(0.5).at(VirtualBeeper.lookup_note('G4')),
		VBeep.new().for_seconds(0.5).at(VirtualBeeper.lookup_note('B4')),
		VBeep.new().for_seconds(0.5).at(VirtualBeeper.lookup_note('A4')),
		VBeep.new().for_seconds(0.5).at(VirtualBeeper.lookup_note('G4')),
		VBeep.new().for_seconds(0.5).at(VirtualBeeper.lookup_note('D4')),
		VBeep.new().for_seconds(1.5).at(VirtualBeeper.lookup_note('C4')),
	])
	pass


func _on_button_simple_pressed() -> void:
	VirtualBeeper.beep(VBeep.new())
	pass


func _on_button_close_encounters_pressed() -> void:
	VirtualBeeper.play([
		VBeep.new().for_seconds(0.7).at(VirtualBeeper.lookup_note('D6')),
		VBeep.new().for_seconds(0.7).at(VirtualBeeper.lookup_note('E6')),
		VBeep.new().for_seconds(0.7).at(VirtualBeeper.lookup_note('C6')),
		VBeep.new().for_seconds(1.0).at(VirtualBeeper.lookup_note('C5')),
		VBeep.new().for_seconds(1.5).at(VirtualBeeper.lookup_note('G5')),
	])
	pass
