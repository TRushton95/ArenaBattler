extends Node
class_name SpellContainer

@export var _spells : Array[Spell] = []


func get_spell_by_index(index: int) -> Spell:
	var result : Spell = null
	
	if index >= 0 && index < _spells.size():
		result = _spells[index]
	
	return result
