extends InputCommand
class_name LeftClickCommand

var _unit : Unit


func _init(unit: Unit) -> void:
	_unit = unit


func get_unit() -> Unit:
	return _unit


func _internal_execute(player: Unit) -> void:
	player.set_selected_unit(_unit)
