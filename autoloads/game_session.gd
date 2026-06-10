extends Node

var game: Game
var player: Player

var player_HP: int
var player_bomb: int

func get_game() -> Game:
	assert(game != null)
	return game

func set_game(new_game: Game) -> void:
	assert(game == null)
	assert(new_game != null)
	game = new_game
	
	player_HP = 2
	player_bomb = 2

func end_game() -> void:
	game = null

func get_player() -> Player:
	assert(player != null)
	return player

func set_player(new_player: Player) -> void:
	assert(player == null)
	assert(new_player != null)
	player = new_player

func end_player() -> void:
	player = null
