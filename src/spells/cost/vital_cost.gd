extends Resource
class_name VitalCost


func can_afford(unit: Unit) -> bool:
	return _internal_can_afford(unit)


func spend(unit: Unit) -> void:
	return _internal_spend(unit)


func _internal_can_afford(_unit: Unit) -> bool:
	return false


func _internal_spend(_unit: Unit) -> void:
	return
