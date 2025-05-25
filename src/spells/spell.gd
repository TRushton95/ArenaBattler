extends Resource
class_name Spell

@export var _cast_duration : float = 0.0
@export var _target_type : TargetType
@export var _effects : Array[Effect] = []


func validate_target(caster: Unit, target: Variant) -> bool:
	return _target_type.validate(caster, target)


func cast(caster: Unit, target: Variant) -> void:
	if !validate_target(caster, target):
		return
		
	for i in _effects.size():
		var effect : Effect = _effects[i]
		if effect == null:
			continue
			
		effect.execute(caster, target)
