extends Effect
class_name DamageEffect

@export var _value : int = 10


func _internal_execute(_caster: Unit, target: Variant) -> void:
	target = target as Unit
	target.damage(_value)
