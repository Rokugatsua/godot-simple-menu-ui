extends MarginContainer

signal change_ui(ui_name)



func _ready():
	get_node("VBoxContainer/PlayButton").grab_focus()



func _on_SettingButton_pressed():
	visible = false
	emit_signal("change_ui", "setting_ui")


func _on_ExitButton_pressed():
	get_tree().quit()
