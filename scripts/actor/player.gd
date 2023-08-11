extends Area2D

const MAX_VEL = 500.0

var vel: Vector2 = Vector2.ZERO
var starting_position: Vector2
var moving_up: bool
var death_fall_vel_y

var rng = RandomNumberGenerator.new()


func die():
	$DeathSound.play()


func reset():
	position = Vector2(200, 220)
	vel = Vector2(0.0, 0.0)
	$DirectionSwitchTimer.set_wait_time(rng.randf_range(0.2, 0.5))
	$DirectionSwitchTimer.start()
	moving_up = false
	death_fall_vel_y = -150
	$Texture.animation = "Alive"


func _ready():
	reset()


func _process(delta):
	position += vel * delta

	# Fall off screen in game over.
	if $"../..".game_over:
		$Texture.animation = "Dead"
		position.y += death_fall_vely * delta
		death_fall_vel_y += 5
		$DirectionSwitchTimer.stop()
		return


func _on_direction_switch_timer_timeout():
	$DirectionSwitchTimer.stop()
	vel = Vector2(0.0, randi_range(50, 100) * (-1 if moving_up else 1))
	moving_up = not moving_up
	$DirectionSwitchTimer.set_wait_time(rng.randf_range(0.5, 1.5))
	$DirectionSwitchTimer.start()
