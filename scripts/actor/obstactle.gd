extends Area2D

var rng = RandomNumberGenerator.new()
var vel: Vector2 = Vector2(-200.0, 0.0)

# Is this pipe currently player controlled.
var active: bool = false:
	get:
		return active
	set(value):
		active = value


func get_width():
	return 52 # Texture width.


func get_height():
	return 640 # Texture height * 2


func _ready():
	# Handle night mode specific details.
	if SettingsManager.night_mode:
		$TextureTop.animation = "Dark"
		$TextureTop/TextureTopExtn.animation = "Dark"
		$TextureBottom.animation = "Dark"
		$TextureBottom/TextureBottomExtn.animation = "Dark"

	# Handle easy mode specific details.
	if SettingsManager.easy_mode:
		$TextureTop.position.y *= SettingsManager.obstacle_easy_bonus
		$TextureBottom.position.y *= SettingsManager.obstacle_easy_bonus
		$BottomCollision.position.y *= SettingsManager.obstacle_easy_bonus
		$BottomCollision.position.y *= SettingsManager.obstacle_easy_bonus


func _process(delta):
	# Handle movement.
	if Input.is_action_pressed("up") and active and position.y > 100:
		vel.y = -200.0
	elif (
		Input.is_action_pressed("down")
		and active
		and position.y < get_viewport().size.y - 100
	):
		vel.y = 200.0
	else:
		vel.y = 0

	# Update position.
	position += vel * delta
	if position.x < -20:
		position = Vector2(817, rng.randi_range(140, 350))


func _on_area_entered(_area):
	$"../..".game_over = true
