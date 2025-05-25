extends TargetType
class_name SelfTargetType


func _internal_validate(caster: Unit, target: Variant) -> bool:
	return caster == target
