extends CanvasLayer
class_name GameUI

const PLAYER_TARGET_LABEL_TEXT_FORMAT : String = "Target: %s"

@onready var _player_target_label : Label = $MarginContainer/VBoxContainer/PlayerTargetLabel
@onready var _mana_bar : ResourceBar = $MarginContainer/VBoxContainer/ManaBar
@onready var _energy_bar : ResourceBar = $MarginContainer/VBoxContainer/EnergyBar


func set_player_target_label_text(value: String) -> void:
	_player_target_label.text = PLAYER_TARGET_LABEL_TEXT_FORMAT % value


func set_energy_bar_visibility(visibility: bool) -> void:
	_energy_bar.visible = visibility


func set_mana_bar_visibility(visibility: bool) -> void:
	_mana_bar.visible = visibility


func set_energy_value(value: int) -> void:
	_energy_bar.value = value


func set_mana_value(value: int) -> void:
	_mana_bar.value = value


func set_energy_max_value(value: int) -> void:
	_energy_bar.set_max_value(value)


func set_mana_max_value(value: int) -> void:
	_mana_bar.set_max_value(value)
