extends Node2D

@onready var _player : Unit = $Player
@onready var _target_dummy : Unit = $TargetDummy
@onready var _player_controller : PlayerController = $PlayerController
@onready var _game_ui : GameUI = $GameUI


func _on_mana_vital_value_changed(value: int) -> void:
	_game_ui.set_mana_value(value)


func _on_mana_vital_max_value_changed(value: int) -> void:
	_game_ui.set_mana_max_value(value)


func _on_energy_vital_value_changed(value: int) -> void:
	_game_ui.set_energy_value(value)


func _on_energy_vital_max_value_changed(value: int) -> void:
	_game_ui.set_energy_max_value(value)


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
	
	var mana_vital : ManaVital = _player.get_mana_vital()
	var energy_vital : EnergyVital = _player.get_energy_vital()
	if mana_vital != null:
		_game_ui.set_mana_bar_visibility(true)
		_game_ui.set_mana_max_value(mana_vital.get_max_value())
		mana_vital.value_changed.connect(_on_mana_vital_value_changed)
		mana_vital.max_value_changed.connect(_on_mana_vital_max_value_changed)
	if _player.get_energy_vital() != null:
		_game_ui.set_energy_bar_visibility(true)
		_game_ui.set_energy_max_value(energy_vital.get_max_value())
		energy_vital.value_changed.connect(_on_energy_vital_value_changed)
		energy_vital.max_value_changed.connect(_on_energy_vital_max_value_changed)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouse_event : InputEventMouseButton = event as InputEventMouseButton
		
		if mouse_event.button_index == MOUSE_BUTTON_LEFT && mouse_event.pressed:
			_player.set_selected_unit(null)
