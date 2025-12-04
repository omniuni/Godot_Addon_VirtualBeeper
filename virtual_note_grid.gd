@tool
extends GridContainer

var _notes: Array[String] = ['C','D','E','F','G','A','B']
var _octaves: Array[String] = ['0','1','2','3','4','5','6','7','8']

func _ready() -> void:
	columns = _octaves.size()
	for n in _notes:
		for o in _octaves:
			var button = load("res://demo_note_button.tscn").instantiate()
			button.note = n+o
			add_child(button)
	pass
