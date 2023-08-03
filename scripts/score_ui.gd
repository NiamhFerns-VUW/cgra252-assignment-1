extends CanvasLayer

var score: int


func score_tick():
	score += 1
	$ScoreCount.text = "Score: " + str(score)


func score_reset():
	score = 0
	$ScoreCount.text = "Score: " + str(score)


func _ready():
	score_reset()
