extends Node

var game: Game

func get_game() -> Game:
	assert(game != null)
	return game

func set_game(new_game: Game) -> void:
	assert(game == null)
	assert(new_game != null)
	game = new_game

func end_game() -> void:
	game = null
