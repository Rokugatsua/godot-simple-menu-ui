extends Control




var _settings := {
	resolution = Vector2(1024, 600),
	fullscreen = false,
	audio_volume = - 5.0,
	sfx_volume = - 5.0,
	}

signal apply_button_pressed(settings)
signal change_ui(ui_name)
signal sfx_play(sfx_name)

func _ready():
	get_node("SettingMenu/SfxSound").set_value_slider(_settings.sfx_volume)
	get_node("SettingMenu/AudioMusicUI").set_value_slider(_settings.audio_volume)


func _on_BackButton_pressed():
	visible = false
	emit_signal("change_ui", "primary_ui")
	emit_signal("sfx_play", "back")


func _on_ApplyButton_pressed():
	emit_signal("apply_button_pressed", _settings)
	emit_signal("sfx_play", "confirm")


func _on_ResolutionSelectUI_resolution_changed(new_resolution: Vector2) -> void:
	_settings.resolution = new_resolution


func _on_FullscreenToggleUI_toggled(is_button_pressed):
	_settings.fullscreen = is_button_pressed


func _on_AudioMusicUI_volume_changed(volume):
	print(volume)
	_settings.audio_volume = volume



func _on_SfxSound_volume_changed(volume):
	_settings.sfx_volume = volume

