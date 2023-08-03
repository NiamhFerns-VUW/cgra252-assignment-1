extends Area2D

var vel: Vector2 = Vector2.ZERO
var x_vel: float = 200.0
const MAX_VEL = 500.0
var starting_position: Vector2


func reset():
	position = Vector2(200, 220)
	vel = Vector2(0.0, 0.0)


# Called when the node enters the scene tree for the first time.
func _ready():
	starting_position = position
	vel = Vector2(0.0, 0.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += vel * delta
	if vel.y < MAX_VEL:
		vel += Vector2(0.0, 10.0)

	if $"../..".game_over:
		position.x += x_vel * delta
		# x_vel = max(0.0, x_vel - 10)
		return

	if Input.is_action_just_pressed("fire"):
		vel = Vector2(0.0, -550.0)

	if position.y > get_viewport().size.y:
		$"../..".game_over = true
	if position.y < 0:
		position.y = 0
		vel.y = 0
