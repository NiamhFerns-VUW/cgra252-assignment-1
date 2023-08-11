extends CanvasLayer


func _on_start_pressed():
	get_tree().change_scene_to_file("res://levels/main_level.tscn")

func _on_opts_pressed():
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()
