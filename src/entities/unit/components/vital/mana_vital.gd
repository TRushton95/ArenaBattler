extends Vital
class_name ManaVital

signal value_changed(value: int)
signal max_value_changed(max_value: int)

@export var _max_value : int = 100
@export var _regen_per_sec : int = 1

var _value : int = 0
var _regen_timer : float = 0.0


func setup() -> void:
	set_value(_max_value)


func update(delta: float) -> void:
	_regen_timer += delta
	if _regen_timer < 1.0:
		return
		
	_regen_timer -= 1.0
	add(_regen_per_sec)


func set_value(value: int) -> void:
	_value = clamp(value, 0, _max_value)
	value_changed.emit(_value)


func set_max_value(value: int) -> void:
	_max_value = value
	max_value_changed.emit(_max_value)


func get_value() -> int:
	return _value


func get_max_value() -> int:
	return _max_value


func add(addition: int) -> void:
	if addition <= 0:
		return
		
	set_value(_value + addition)


func subtract(subtraction: int) -> void:
	if subtraction <= 0:
		return
		
	set_value(_value - subtraction)
