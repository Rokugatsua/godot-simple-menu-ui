extends Control


var audio_paused: bool = false

var sfx = {
	back = preload("res://Assets/Audio/Sfx/back_style_5_001.ogg"),
	confirm = preload("res://Assets/Audio/Sfx/confirm_style_4_001.ogg"),
	cursor = preload("res://Assets/Audio/Sfx/cursor_style_2.ogg"),
	error = preload("res://Assets/Audio/Sfx/error_style_4_001.ogg")
	}

var focus_owner 

onready var primary_ui := $PrimaryUI
onready var setting_ui := $SettingUI
onready var audio_player := $AudioStreamPlayer
onready var sfx_player := $SfxPlayer


func _ready():
	primary_ui.connect("change_ui",self,"_on_change_ui")
	setting_ui.connect("change_ui", self, "_on_change_ui")
	
	var focus_owner = get_focus_owner()
	
func _input(event):
	var new_focus_owner = get_focus_owner()
	var focus_name = new_focus_owner.name if new_focus_owner else "null_object"
	if focus_owner != new_focus_owner and focus_name != "null_object":
		if focus_name != "ExitButton" and focus_name != "ApplyButton":
			_sfx_play("cursor")
	focus_owner = new_focus_owner
	print(focus_name)
	
func _on_change_ui(ui_name):
	if ui_name == "setting_ui":
		setting_ui.visible = true
	elif ui_name == "primary_ui":
		primary_ui.visible = true


func _on_SettingUI_apply_button_pressed(settings: Dictionary) -> void:
	update_settings(settings)
	

func update_settings(settings: Dictionary) -> void:
	OS.window_fullscreen = settings.fullscreen
	get_tree().set_screen_stretch(
		SceneTree.STRETCH_MODE_2D, SceneTree.STRETCH_ASPECT_KEEP, settings.resolution
	)
	OS.set_window_size(settings.resolution)
	
	if settings.audio_volume < -19.0 and not audio_paused:
		audio_pause(true)
	elif settings.audio_volume >= -19.0 and audio_paused:
		audio_pause(false)
	audio_player.volume_db = settings.audio_volume
	
	sfx_player.volume_db = settings.sfx_volume

func audio_pause(is_pause):
	audio_paused = is_pause
	audio_player.stream_paused = is_pause
	

func _sfx_play(audio):
	sfx_player.set_stream(sfx[audio])
	sfx_player.play()



func _on_SettingUI_sfx_play(sfx_name):
	_sfx_play(sfx_name)
