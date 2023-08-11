extends CanvasLayer


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		$"..".game_over = false
		get_tree().change_scene_to_file("res://levels/main_menu.tscn")

	if event.is_action_pressed("fire"):
		$"..".game_over = false


func _ready():
	hide()
