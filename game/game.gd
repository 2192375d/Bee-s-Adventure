extends Node2D

class_name Game

func _ready() -> void:
	Log.add_message("game running")
	GameSession.set_game(self)
