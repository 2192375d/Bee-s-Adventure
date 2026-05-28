extends Node

var gamesize_x: float = 360
var gamesize_y: float = 448

# function only works if input is a direct child of Game class
func in_game_border(position: Vector2) -> bool:
	if position.x < 0:
		return false
	if position.x > gamesize_x:
		return false
	if position.y < 0:
		return false
	if position.y > gamesize_y:
		return false
	return true
