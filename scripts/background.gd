extends Node2D

# 0px + (3 * image width) + half image width.
# 3x background to take up screen + 1 to remove seem.
const START = 1005
const END = -144  # Half image width.
const VEL = Vector2(-50, 0)  # Scrolling speed


func _process(delta):
	position += VEL * delta
	if position.x <= END:
		position.x = (START + position.x)  # Need to remove the amount moved + half the image width due to left most background being -144 past 0.
