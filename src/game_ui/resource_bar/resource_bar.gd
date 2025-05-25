extends ProgressBar
class_name ResourceBar

const TEXT_FORMAT : String = "%s / %s"

@onready var _label : Label = $Label


func set_max_value(new_max_value: float) -> void:
	max_value = new_max_value
	_label.text = TEXT_FORMAT % [snapped(value, 1), snapped(max_value, 1)]


func _on_value_changed(value: float) -> void:
	_label.text = TEXT_FORMAT % [snapped(value, 1), snapped(max_value, 1)]
