extends Node2D

class_name Game

@export var bee: Player

@export var chapters: Array[Chapter]
@export var other_chapters: Array[Chapter]
@export var run_other: bool = false
@export var chapter_num: int = -1

@export var stats_component: StatsComponent

@export var clear_screen_timer: Timer
@export var clear_screen_time: float

signal player_hit

func _init() -> void:
	Global.game = self

func _ready() -> void:
	
	stats_component.HP_num = 2
	stats_component.spell_num = Global.NUM_SPELL_ON_RESET
	stats_component.score = 0
	
	stats_component.in_game_stats_changed.emit.call_deferred()
	
	player_hit.connect(_on_player_hit)
	
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


func _on_player_hit() -> void:
	#if bee.invincible:
		#return
	print("player hit!")
	
	if (stats_component.HP_num == 0):
		# player is dead, do stuffs
		return
	
	stats_component.decrement_HP()
	clear_screen_timer.start(clear_screen_time)

func _process(_delta: float) -> void:
	if !clear_screen_timer.is_stopped():
		for node: Node in get_children():
			if node.is_in_group("enemy-bullet"):
				node.queue_free()
