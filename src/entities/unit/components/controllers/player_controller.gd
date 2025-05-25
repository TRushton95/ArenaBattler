extends Node2D

@export var _unit : Unit


func _process(_delta_s: float) -> void:
	if Input.is_action_just_pressed("right_click"):
		_unit.set_movement_destination(get_global_mouse_position())
