extends Node

class_name StatsComponent

var HP_num: int
var spell_num: int
var score: int

signal in_game_stats_changed

func decrement_HP() -> void:
	if HP_num <= 0:
		return
	
	HP_num -= 1
	in_game_stats_changed.emit()

func increment_HP() -> void:
	if HP_num >= 6:
		return
	HP_num += 1
	in_game_stats_changed.emit()

func set_HP(new_HP_num: int) -> void:
	HP_num = new_HP_num
	in_game_stats_changed.emit()

func decrement_spell() -> void:
	if spell_num <= 0:
		# oh no something is bugging then!
		return
	
	spell_num -= 1
	in_game_stats_changed.emit()

func increment_spell() -> void:
	if spell_num >= Global.MAXIMUM_HP_SPELL:
		return
	spell_num += 1
	in_game_stats_changed.emit()

func set_spell(new_spell_num: int) -> void:
	spell_num = new_spell_num
	in_game_stats_changed.emit()

func add_score(amount: int) -> void:
	if score + amount < 0:
		score = 0
		return
	
	if score + amount > Global.MAXIMUM_SCORE:
		score = Global.MAXIMUM_SCORE
		return
	
	score += amount
