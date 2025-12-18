extends Node

const MAXIMUM_HP_SPELL = 6
const NUM_SPELL_ON_RESET = 3
const MAXIMUM_SCORE = 100000000

var gameSizeX: float = 640.0
var gameSizeY: float = 736.0

var game: Game

func get_game() -> Game:
	if !game:
		printerr("Error: not in game")
		return
	return game

func get_bee() -> Player:
	if !game.bee:
		#printerr()
		printerr("Error: bee missing")
		print_stack()
		return
	return game.bee
