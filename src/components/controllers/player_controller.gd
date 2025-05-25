extends Node2D
class_name PlayerController

@export var _player : Unit


func _process(_delta_s: float) -> void:
	if Input.is_action_just_pressed("right_click"):
		_player.set_movement_destination(get_global_mouse_position())
		
	if Input.is_action_just_pressed("cast_spell_1"):
		_try_cast(0)
	elif Input.is_action_just_pressed("cast_spell_2"):
		_try_cast(1)
	elif Input.is_action_just_pressed("cast_spell_3"):
		_try_cast(2)


func _try_cast(spell_index: int) -> void:
	var target : Unit = _player.get_selected_unit()
	
	if !_player.validate_cast(spell_index, target):
		print("Invalid target!")
		return
		
	if !_player.can_afford(spell_index):
		print("Can't afford spell!")
		return
		
	_player.cast(spell_index, target)
