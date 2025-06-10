extends Node2D
# 2d_test.gd
# Script for the test scene.

@onready var text_edit: TextEdit = $Control/TextEdit


## Set the current input type.
func _input(event: InputEvent) -> void:

	# Check if the event is not joypad motion (Switch drift causes a lot of noise)
	if event is not InputEventJoypadMotion:

		# Get all actions from the input map
		var all_actions = InputMap.get_actions()

		# Iterate of each action
		for action in all_actions:

			# Check if the input event matches the action
			if event.is_action_pressed(action):

				# Update the text field with the matching action
				text_edit.text = action

				# Stop iterating through each of the actions
				break
