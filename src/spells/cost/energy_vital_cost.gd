extends VitalCost
class_name EnergyVitalCost

@export var _value : int = 10


func _internal_can_afford(unit: Unit) -> bool:
	if unit == null:
		return false
		
	var _energy_vital : EnergyVital = unit.get_energy_vital()
	if _energy_vital == null:
		return false
		
	return _energy_vital.get_value() >= _value


func _internal_spend(unit: Unit) -> void:
	if unit == null:
		return
		
	var _energy_vital : EnergyVital = unit.get_energy_vital()
	if _energy_vital == null:
		return
		
	_energy_vital.subtract(_value)
