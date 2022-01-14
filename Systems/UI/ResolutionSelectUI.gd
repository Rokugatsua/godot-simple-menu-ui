extends Control

signal resolution_changed(new_resolution)

onready var option_button := $OptionButton


func _on_OptionButton_item_selected(index: int) -> void:
	_update_selected_item(option_button.text)


func _update_selected_item(text: String) -> void:
	var values := text.split_floats("x")
	print(values)
	emit_signal("resolution_changed", Vector2(values[0], values[1]))
