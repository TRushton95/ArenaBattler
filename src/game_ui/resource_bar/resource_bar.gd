extends ProgressBar
class_name ResourceBar

const TEXT_FORMAT : String = "%s / %s"

@onready var _label : Label = $Label


func set_max_value(new_max_value: float) -> void:
	max_value = new_max_value
	_label.text = TEXT_FORMAT % [value, max_value]


func _on_value_changed(value: float) -> void:
	_label.text = TEXT_FORMAT % [value, max_value]
