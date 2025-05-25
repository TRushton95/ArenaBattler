extends Node2D
class_name PlayerController

@export var _player : Unit


func _process(_delta_s: float) -> void:
	if Input.is_action_just_pressed("right_click"):
		_player.set_movement_destination(get_global_mouse_position())


func handle_input_command(input_command : InputCommand) -> void:
	if input_command is LeftClickCommand:
		if input_command.get_unit() == null:
			return
			
		_player.set_selected_unit(input_command.get_unit())
