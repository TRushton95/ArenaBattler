extends Node2D

@onready var _player : Unit = $Player
@onready var _target_dummy : Unit = $TargetDummy
@onready var _game_ui : GameUI = $GameUI


func _on_player_selected_unit_changed(unit: Unit) -> void:
	var text : String = unit.get_display_name() if unit != null else "None"
	_game_ui.set_player_target_label_text(text)


func _on_unit_right_clicked(unit: Unit) -> void:
	pass


func _on_unit_left_clicked(unit: Unit) -> void:
	var command : LeftClickCommand = LeftClickCommand.new(unit)
	command.execute(_player)


func _ready() -> void:
	_player.right_clicked.connect(_on_unit_right_clicked.bind(_player))
	_player.left_clicked.connect(_on_unit_left_clicked.bind(_player))
	_target_dummy.right_clicked.connect(_on_unit_left_clicked.bind(_target_dummy))
	_target_dummy.left_clicked.connect(_on_unit_left_clicked.bind(_target_dummy))


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouse_event : InputEventMouseButton = event as InputEventMouseButton
		
		if mouse_event.button_index == MOUSE_BUTTON_LEFT && mouse_event.pressed:
			_player.set_selected_unit(null)
