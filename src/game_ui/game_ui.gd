extends CanvasLayer
class_name GameUI

const PLAYER_TARGET_LABEL_TEXT_FORMAT : String = "Target: %s"

@onready var _player_target_label : Label = $MarginContainer/PlayerTargetLabel


func set_player_target_label_text(value: String) -> void:
	_player_target_label.text = PLAYER_TARGET_LABEL_TEXT_FORMAT % value
