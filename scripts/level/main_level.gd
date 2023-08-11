extends Node2D

var current_pipe  # Index of pipe immediate in front of player.
var pipes = []  # All pipes.
var rng = RandomNumberGenerator.new()

var game_over: bool = false:
	get:
		return game_over
	set(value):
		game_over = value
		if game_over:
			$Gameplay/Player.die()
			get_tree().paused = true
			$DeathUI.show()
			return
		game_reset()
		$DeathUI.hide()
		get_tree().paused = false


# Reset the game to start state.
func game_reset():
	$"Gameplay/ScoreUI".score_reset()
	reposition_pipes()
	$"Gameplay/Player".reset()


# Reset pipes to starting position.
func reposition_pipes():
	pipes[current_pipe].set_inactive()
	current_pipe = 0
	pipes[current_pipe].set_active()
	for i in range(0, pipes.size()):
		pipes[i].position = Vector2(680 + (i * 200), rng.randi_range(140, 350))


# Place pipes in starting position.
func spawn_pipes(n: int):
	var obstacle = load("res://actors/obstacle.tscn")
	for i in range(0, n):
		var obstacle_instance = obstacle.instantiate()
		obstacle_instance.set_name("pipe" + str(i))
		obstacle_instance.position = Vector2(680 + (i * 200), rng.randi_range(140, 350))
		pipes.append(obstacle_instance)
		$Gameplay.add_child(obstacle_instance)


func _ready():
	spawn_pipes(4)
	current_pipe = 0
	pipes[0].set_active()


func _process(_delta):
	# Score on passing a pipe.
	if (
		!game_over
		and (
			$"Gameplay/Player".position.x
			> pipes[current_pipe].position.x + (pipes[0].get_width() / 2)
		)
	):
		$"Gameplay/ScoreUI".score_tick()
		pipes[current_pipe].set_inactive()
		current_pipe = (current_pipe + 1) % pipes.size()
		pipes[current_pipe].set_active()
