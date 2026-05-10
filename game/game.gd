extends Node2D

class_name Game

@export var chapters: Array[Chapter]

func _ready() -> void:
	Log.add_message("game running")
	GameSession.set_game(self)
	
	
