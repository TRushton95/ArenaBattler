extends RefCounted
class_name InputCommand


func execute(_player: Unit) -> void:
	_internal_execute(_player)


func _internal_execute(_player: Unit) -> void:
	pass
