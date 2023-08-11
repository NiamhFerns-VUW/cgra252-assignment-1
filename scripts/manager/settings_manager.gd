extends Object

signal night_mode_toggle(value: bool)


var night_mode: bool = false:
	get: # Is it night mode?
		return night_mode
	set(value): # Toggle Night Mode & inform listeners.
		night_mode = value
		night_mode_toggle.emit(night_mode)

var easy_mode: bool = false:
	get: # Is it easy mode?
		return easy_mode
	set(value): # Toggle Night Mode & inform listeners.
		easy_mode = value
