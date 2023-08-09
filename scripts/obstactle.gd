extends Area2D

var rng = RandomNumberGenerator.new()
var vel: Vector2 = Vector2(-200.0, 0.0)
var active_obstacle: bool = false

func set_active():
	active_obstacle = true

func set_inactive():
	active_obstacle = false

func get_width():
	return $TopTexture.texture.get_width()


func get_height():
	return $TopTexture.texture.get_height()


func _process(delta):
	if Input.is_action_pressed("up") and active_obstacle:
		vel.y = -200.0
	elif Input.is_action_pressed("down") and active_obstacle:	
		vel.y = 200.0
	else:
		vel.y = 0

	position += vel * delta
	if position.x < -20:
		position = Vector2(817, rng.randi_range(140, 350))


func _on_area_entered(_area):
	$"../..".game_over = true
