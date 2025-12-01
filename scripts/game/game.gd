extends Node2D

class_name Game

@export var bee: Player
@export var chapters: Array[Chapter]

func _init() -> void:
	Global.game = self

func _ready() -> void:
	for chapter in chapters:
		await chapter.handle_chapter()

func _process(_delta: float) -> void:
	pass
	
	# TODO: add stuffs
