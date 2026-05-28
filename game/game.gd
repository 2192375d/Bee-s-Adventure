extends Node2D

class_name Game

@export var chapters: Array[Chapter]

func _ready() -> void:
	print("game running")
	GameSession.set_game(self)
	
	for chapter: Chapter in chapters:
		await chapter.run()
	
	print("game should have ended now!")
