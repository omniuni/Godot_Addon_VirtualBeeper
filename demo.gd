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
