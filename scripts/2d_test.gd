extends Node2D

@onready var text_edit: TextEdit = $Control/TextEdit


## Set the current input type.
func _input(event: InputEvent) -> void:
	if event is not InputEventJoypadMotion:
		var all_actions = InputMap.get_actions()
		for action in all_actions:
			if event.is_action_pressed(action):
				text_edit.text = action
				break
