extends Area2D

var vel: Vector2 = Vector2.ZERO
var x_vel: float = 200.0
const MAX_VEL = 500.0
var starting_position: Vector2

var rng = RandomNumberGenerator.new()

func reset():
	position = Vector2(200, 220)
	vel = Vector2(0.0, 0.0)
	$JumpTimer.set_wait_time(rng.randf_range(0.2, 0.5))
	# $JumpTimer.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	reset()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += vel * delta
	# if vel.y < MAX_VEL:
	# 	vel += Vector2(0.0, 10.0)

	# Fall off screen in game over.
	if $"../..".game_over:
		position.x += x_vel * delta
		$JumpTimer.stop()
		# x_vel = max(0.0, x_vel - 10)
		return

	# Don't let the bird go off screen.
	if position.y > get_viewport().size.y - 50:
		vel = Vector2(0.0, -550.0)

	if position.y < 0:
		position.y = 0
		vel.y = 0


func _on_jump_timer_timeout():
		$JumpTimer.stop()
		vel = Vector2(0.0, -550.0)
		$JumpTimer.set_wait_time(rng.randf_range(0.2, 1.0))
		$JumpTimer.start()
