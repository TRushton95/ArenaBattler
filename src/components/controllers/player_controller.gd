extends Node2D
class_name PlayerController

@export var _player : Unit


func _process(_delta_s: float) -> void:
	if Input.is_action_just_pressed("right_click"):
		_player.set_movement_destination(get_global_mouse_position())
		
	if Input.is_action_just_pressed("cast_spell_1"):
		_player.cast(0, _player.get_selected_unit())
	elif Input.is_action_just_pressed("cast_spell_2"):
		_player.cast(1, _player.get_selected_unit())
