extends Node

var gameSizeX: float = 640.0
var gameSizeY: float = 736.0

var game: Game

func get_game() -> Game:
	return game

func get_bee() -> Player:
	return game.bee
