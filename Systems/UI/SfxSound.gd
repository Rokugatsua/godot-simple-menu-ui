extends Control

signal volume_changed(volume)

var volume : float

onready var audio_volume_slider: = $AudioVolume

func _on_AudioVolume_value_changed(value):
	emit_signal("volume_changed", value)
	
func set_value_slider(value):
	volume = value
	audio_volume_slider.value = value
