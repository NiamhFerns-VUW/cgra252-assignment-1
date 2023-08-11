extends CanvasLayer

func _ready():
	$GridContainer/VolumeSlider.value = SettingsManager.audio_level
	$GridContainer/NightMode/Toggle.button_pressed = SettingsManager.night_mode
	$GridContainer/EasyMode/Toggle.button_pressed = SettingsManager.easy_mode

func _on_night_mode_toggled(button_pressed: bool):
	SettingsManager.night_mode = button_pressed  # Replace with function body.


func _on_easy_mode_toggled(button_pressed: bool):
	SettingsManager.easy_mode = button_pressed


func _on_back_pressed():
	get_tree().change_scene_to_file("res://levels/main_menu.tscn")


func _on_volume_slider_value_changed(value):
	SettingsManager.audio_level = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))
