extends Node2D

class_name Game

@export var bee: Player
@export var chapters: Array[Chapter]
@export var other_chapters: Array[Chapter]
@export var run_other: bool = false
@export var chapter_num: int = -1

func _init() -> void:
	Global.game = self

func _ready() -> void:
	
	if (chapter_num != -1):
		debug_chapter(chapter_num)
		return
	
	for chapter in chapters:
		await chapter.handle_chapter()

func debug_chapter(chapter_num_to_debug: int) -> void:
	if run_other:
		other_chapters[chapter_num_to_debug].handle_chapter()
	else:
		chapters[chapter_num_to_debug].handle_chapter()

func _process(_delta: float) -> void:
	pass
	
	# TODO: add stuffs
