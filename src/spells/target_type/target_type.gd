extends Resource
class_name TargetType


func validate(caster: Unit, target: Variant) -> bool:
	return _internal_validate(caster, target)


func _internal_validate(_caster: Unit, _target: Variant) -> bool:
	return false
