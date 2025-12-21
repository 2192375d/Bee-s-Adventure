extends Node2D

class_name Game

@export var bee: Player

@export var background: TextureRect

@export var standard_background: Texture2D
@export var spell_background: Texture2D

@export var chapters: Array[Chapter]
@export var other_chapters: Array[Chapter]
@export var run_other: bool = false
@export var chapter_num: int = -1

@export var stats_component: StatsComponent

@export var clear_screen_timer: Timer
@export var clear_screen_time: float

@export var spell_card_timer: Timer
@export var spell_card_time: float

@export var spell_card_sub_timer: Timer
@export var spell_card_sub_time: float 

#expected to be k * spell_card_sub_time = spell_card_time, k\in\mathbb{N}

signal player_hit

func _init() -> void:
	Global.game = self

func _ready() -> void:
	
	stats_component.HP_num = 2
	stats_component.spell_num = Global.NUM_SPELL_ON_RESET
	stats_component.score = 0
	stats_component.graze = 0
	
	stats_component.in_game_stats_changed.emit.call_deferred()
	
	player_hit.connect(_on_player_hit)
	
	background.texture = standard_background
	
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
	print("player hit!")
	stats_component.add_score(Global.PLAYER_HIT_SCORE)
	
	if stats_component.HP_num == 0:
		return
	
	stats_component.decrement_HP()
	stats_component.spell_num = max(stats_component.spell_num, Global.NUM_SPELL_ON_RESET)
	damage_on_screen_enemy(Global.PLAYER_HIT_DAMAGE)
	clear_screen_timer.start(clear_screen_time)

func _process(_delta: float) -> void:
	if !clear_screen_timer.is_stopped():
		clear_on_screen_bullet()
	
	if !spell_card_timer.is_stopped():
		clear_on_screen_bullet()
	
	if Input.is_action_just_pressed("ui_bomb") && \
	bee.visible && \
	spell_card_timer.is_stopped() && \
	stats_component.spell_num > 0:
		background.texture = spell_background
		spell_card_timer.start(spell_card_time)
		spell_card_sub_timer.start(spell_card_sub_time)
		stats_component.decrement_spell()
		bee.invincible = true

func _on_spellcardtimer_timeout() -> void:
	background.texture = standard_background
	bee.invincible = false

func _on_spellcardsubtimer_timeout() -> void:
	damage_on_screen_enemy(Global.SPELL_DAMAGE)
	if !spell_card_timer.is_stopped():
		spell_card_sub_timer.start(spell_card_sub_time)

func clear_on_screen_bullet() -> void:
	for node: Node in get_children():
		if node.is_in_group("enemy-bullet"):
			node.queue_free()

func damage_on_screen_enemy(damage: int) -> void:
	for node: Node in get_children():
		if node is Enemy:
			node.get_hit(damage)
