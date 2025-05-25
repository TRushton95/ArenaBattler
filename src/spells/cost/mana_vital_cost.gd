extends VitalCost
class_name ManaVitalCost

@export var _value : int = 10


func _internal_can_afford(unit: Unit) -> bool:
	if unit == null:
		return false
		
	var _mana_vital : ManaVital = unit.get_mana_vital()
	if _mana_vital == null:
		return false
		
	return _mana_vital.get_value() >= _value


func _internal_spend(unit: Unit) -> void:
	if unit == null:
		return
		
	var _mana_vital : ManaVital = unit.get_mana_vital()
	if _mana_vital == null:
		return
		
	_mana_vital.subtract(_value)
