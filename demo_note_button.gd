@tool
extends PanelContainer

@onready var button: Button = $Button

@export var note: String = ''
		
func _process(_delta: float) -> void:
	if button.text != note:
		button.text = note
	pass

func _on_button_pressed() -> void:
	VirtualBeeper.beep(
		VBeep.new().for_seconds(0.5).at(VirtualBeeper.lookup_note(note))
	)
	pass
