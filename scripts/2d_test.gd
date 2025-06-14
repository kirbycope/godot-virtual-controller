extends Node2D
# 2d_test.gd
# Script for the test scene.

@onready var reset_theme: TextureButton = $Control/Theme/ResetTheme
@onready var text_edit: TextEdit = $Control/TextEdit
@onready var virtual_controller: Node2D = $Controls/VirtualController


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


## Handle "NES" button press.
func _on_nes_pressed() -> void:
	reset_theme.show()
	virtual_controller.update_theme(virtual_controller.theme.NintendoEntertainmentSystem)


## Handle "SNES" button press.
func _on_snes_pressed() -> void:
	reset_theme.show()
	virtual_controller.update_theme(virtual_controller.theme.SuperNintendoEntertainmentSystem)


## Handle "New 3DS" button press.
func _on_n_3ds_pressed() -> void:
	reset_theme.show()
	virtual_controller.update_theme(virtual_controller.theme.NewNintendo3DS)


## Handle "N64" button press.
func _on_n_64_pressed() -> void:
	reset_theme.show()
	virtual_controller.update_theme(virtual_controller.theme.Nintendo64)


## Handle "NGC" button press.
func _on_ngc_pressed() -> void:
	reset_theme.show()
	virtual_controller.update_theme(virtual_controller.theme.NintendoGameCube)


## Handle reset button press.
func _on_reset_theme_pressed() -> void:
	reset_theme.hide()
	virtual_controller.update_theme(virtual_controller.theme.DEFAULT)


## Handle "XBox Series S" button press.
func _on_x_box_s_pressed() -> void:
	reset_theme.show()
	virtual_controller.update_theme(virtual_controller.theme.XBoxSeriesS)


## Handle "XBox Series X" button press.
func _on_x_box_x_pressed() -> void:
	reset_theme.show()
	virtual_controller.update_theme(virtual_controller.theme.XBoxSeriesX)


func _on_ps_5_pressed() -> void:
	reset_theme.show()
	virtual_controller.update_theme(virtual_controller.theme.PlayStationSeries)
