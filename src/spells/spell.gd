extends Resource
class_name Spell

@export var _cast_duration : float = 0.0
@export var _target_type : TargetType
@export var _vital_costs : Array[VitalCost] = []
@export var _effects : Array[Effect] = []


func validate_target(caster: Unit, target: Variant) -> bool:
	return _target_type.validate(caster, target)


func can_afford(caster: Unit) -> bool:
	for i in _vital_costs.size():
		var vital_cost : VitalCost = _vital_costs[i]
		if vital_cost == null:
			continue
			
		if !vital_cost.can_afford(caster):
			return false
			
	return true


func cast(caster: Unit, target: Variant) -> void:
	if !validate_target(caster, target) || !can_afford(caster):
		return
		
	for i in _vital_costs.size():
		var vital_cost : VitalCost = _vital_costs[i]
		if vital_cost == null:
			continue
			
		vital_cost.spend(caster)
		
	for i in _effects.size():
		var effect : Effect = _effects[i]
		if effect == null:
			continue
			
		effect.execute(caster, target)
