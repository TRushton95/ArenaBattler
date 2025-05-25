extends CharacterBody2D
class_name Unit

signal left_clicked
signal right_clicked
signal selected_unit_changed(unit: Unit)

const MOVE_SPEED : float = 300.0

@export var _display_name : String
@export var _sprite : Sprite2D
@export var _collision_shape : CollisionShape2D
@export var _spell_container : SpellContainer

var _selected_unit : Unit
var _movement_destination : Vector2


func _on_input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
		
	var mouse_button_event : InputEventMouseButton = event as InputEventMouseButton
	if !mouse_button_event.pressed:
		return
		
	if mouse_button_event.button_index == MOUSE_BUTTON_RIGHT:
		right_clicked.emit()
	elif mouse_button_event.button_index == MOUSE_BUTTON_LEFT:
		left_clicked.emit()


func _ready() -> void:
	_movement_destination = position
	input_event.connect(_on_input_event)
	input_pickable = true


func _process(delta: float) -> void:
	_handle_movement(delta)


func get_display_name() -> String:
	return _display_name


func get_selected_unit() -> Unit:
	return _selected_unit


func set_selected_unit(unit: Unit) -> void:
	_selected_unit = unit
	selected_unit_changed.emit(unit)


func set_movement_destination(destination: Vector2) -> void:
	_movement_destination = destination


func validate_cast(index: int, target: Unit) -> bool:
	var spell : Spell = _spell_container.get_spell_by_index(index)
	if spell == null:
		return false
		
	return spell.validate_target(self, target)


func cast(index: int, target: Unit) -> void:
	var spell : Spell = _spell_container.get_spell_by_index(index)
	if spell == null:
		return
		
	return spell.cast(self, target)


func damage(value: int) -> void:
	value = value if value > 0 else 0
	print("%s was damaged for %s" % [_display_name, str(value)])


func heal(value: int) -> void:
	value = value if value > 0 else 0
	print("%s was healed for %s" % [_display_name, str(value)])


func _handle_movement(delta: float) -> void:
	if _movement_destination == position:
		return
		
	if position.distance_to(_movement_destination) < MOVE_SPEED * delta:
		position = _movement_destination
		return
		
	var direction : Vector2 = position.direction_to(_movement_destination)
	var movement_delta : Vector2 = direction * MOVE_SPEED * delta
	
	position += movement_delta
