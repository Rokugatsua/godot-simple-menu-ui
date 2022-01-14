extends Control

signal volume_changed(volume)

var volume_value: float

onready var music_volume_slider:HSlider = $MusicVolume


func _on_MusicVolume_value_changed(value):
	emit_signal("volume_changed", value)

func set_value_slider(value):
	volume_value = value
	music_volume_slider.value = value
