extends Node2D

class_name Game

@export var chapters: Array[Chapter]
@export var player: Player

func _ready() -> void:
	GameSession.set_game(self)
	GameSession.set_player(player)
	
	for chapter: Chapter in chapters:
		await chapter.run()
