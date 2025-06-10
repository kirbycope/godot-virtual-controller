extends Node2D

@onready var text_edit: TextEdit = $Control/TextEdit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _input(event: InputEvent) -> void:
	# Only process events that could trigger actions
	if event is InputEventKey or event is InputEventJoypadButton or event is InputEventJoypadMotion or event is InputEventMouseButton:
		var all_actions = InputMap.get_actions()
		for action in all_actions:
			if event.is_action_pressed(action):
				text_edit.text = action
				break
