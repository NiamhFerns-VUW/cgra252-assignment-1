extends Area2D

var vel: Vector2 = Vector2.ZERO
const MAX_VEL = 500.0


# Called when the node enters the scene tree for the first time.
func _ready():
	vel = Vector2(0.0, 200.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += vel * delta
	if vel.y < MAX_VEL:
		vel += Vector2(0.0, 10.0)

	if Input.is_action_just_pressed("fire"):
		vel = Vector2(0.0, -550.0)

	if position.y > get_viewport().size.y:
		$"..".game_over()
	if position.y < 0:
		position.y = 0
		vel.y = 0
