extends Node2D

var current_pipe  # Index of pipe immedietely in front of player.
var pipes = []  # All pipes.
var rng = RandomNumberGenerator.new()

var game_over: bool = false:
	get:
		return game_over
	set(value):
		game_over = value
		if game_over:
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
	current_pipe = 0
	for i in range(0, pipes.size()):
		pipes[i].position = Vector2(680 + (i * 200), rng.randi_range(140, 350))


# Place pipes in starting position.
func spawn_pipes(n: int):
	var obstacle = load("res://actors/obstacle.tscn")
	for i in range(0, n):
		var obstactle_instance = obstacle.instantiate()
		obstactle_instance.set_name("pipe" + str(i))
		obstactle_instance.position = Vector2(680 + (i * 200), rng.randi_range(140, 350))
		pipes.append(obstactle_instance)
		$Gameplay.add_child(obstactle_instance)


func _ready():
	spawn_pipes(4)
	current_pipe = 0


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
		current_pipe = (current_pipe + 1) % pipes.size()
