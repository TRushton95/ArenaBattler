extends TargetType
class_name EnemyTargetType


func _internal_validate(caster: Unit, target: Variant) -> bool:
	return target is Unit && caster != target
