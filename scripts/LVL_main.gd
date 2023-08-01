extends Node2D

var pipes = []
var rng = RandomNumberGenerator.new()


func game_over():
	print("Hit!")


func spawn_pipes(n: int):
	var obstacle = load("res://actors/obstacle.tscn")
	for i in range(0, n):
		var obstactle_instance = obstacle.instantiate()
		obstactle_instance.set_name("pipe" + str(i))
		obstactle_instance.position = Vector2(617 + (i * 200), rng.randi_range(140, 350))
		pipes.append(obstactle_instance)
		add_child(obstactle_instance)


func _ready():
	spawn_pipes(4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
