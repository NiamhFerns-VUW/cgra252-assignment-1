extends Area2D

var rng = RandomNumberGenerator.new()
const vel: Vector2 = Vector2(-200.0, 0.0)


func get_width():
	return $TopTexture.texture.get_width()


func get_height():
	return $TopTexture.texture.get_height()


func _process(delta):
	position += vel * delta
	if position.x < -20:
		position = Vector2(817, rng.randi_range(140, 350))


func _on_area_entered(_area):
	$"../..".game_over = true
