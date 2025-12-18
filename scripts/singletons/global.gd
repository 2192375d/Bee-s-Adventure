extends Node

const MAXIMUM_HP_SPELL = 6
const NUM_SPELL_ON_RESET = 3
const MAXIMUM_SCORE = 99999999
const MAXIMUM_GRAZE = 99999

const ENEMY_KILLED_SCORE1 = 500
const ENEMY_KILLED_SCORE2 = 1000
const ENEMY_KILLED_SCORE3 = 7500

const ENEMY_HIT_SCORE = 10

const GRAZE_SCORE = 50

const PLAYER_HIT_SCORE = -50000

const PLAYER_BULLET_DAMAGE = 1
const PLAYER_HIT_DAMAGE = 7

const SPELL_DAMAGE = 5

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
