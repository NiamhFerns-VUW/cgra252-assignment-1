extends Node2D

signal night_mode_toggle(value: bool)

var night_mode: bool = false:
	get:  # Is it night mode?
		return night_mode
	set(value):
		night_mode = value
		print("Night Mode is now " + ("ON" if night_mode else "OFF"))
		night_mode_toggle.emit(night_mode)

var easy_mode: bool = false:
	get:  # Is it easy mode?
		return easy_mode
	set(value):  # Toggle Night Mode & inform listeners.
		easy_mode = value
		print("Easy Mode is now " + ("ON" if easy_mode else "OFF"))

var audio_level: float = 1.0:
	get:
		return audio_level
	set(value):
		if value > 1.0 or value < 0.0:
			assert(false, "Audio value out of range.")  # Godot exceptions wouldn't work...

		audio_level = value
		print("Audio Level is now " + str(value))

const obstacle_easy_bonus: float = 1.1
