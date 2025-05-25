extends CharacterBody2D
class_name Unit

const MOVE_SPEED : float = 300.0

var _movement_destination : Vector2


func _ready() -> void:
	_movement_destination = position


func _process(delta: float) -> void:
	_handle_movement(delta)


func set_movement_destination(destination: Vector2) -> void:
	_movement_destination = destination


func _handle_movement(delta: float) -> void:
	if _movement_destination == position:
		return
		
	if position.distance_to(_movement_destination) < MOVE_SPEED * delta:
		position = _movement_destination
		return
		
	var direction : Vector2 = position.direction_to(_movement_destination)
	var movement_delta : Vector2 = direction * MOVE_SPEED * delta
	
	position += movement_delta
