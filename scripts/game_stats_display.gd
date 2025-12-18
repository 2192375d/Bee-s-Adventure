extends Panel

@export var HP_icon: Texture2D
@export var HP_full_icon: Texture2D
@export var spell_icon: Texture2D
@export var spell_full_icon: Texture2D

@export var HP_textures: Array[TextureRect]
@export var spell_textures: Array[TextureRect]
@export var score_display: RichTextLabel
@export var graze_display: RichTextLabel

func _ready() -> void:
	Global.get_game().stats_component.in_game_stats_changed.connect(_on_in_game_stats_changed)

func _on_in_game_stats_changed() -> void:
	var HP_num = Global.get_game().stats_component.HP_num
	var spell_num = Global.get_game().stats_component.spell_num
	var score = Global.get_game().stats_component.score
	var graze = Global.get_game().stats_component.graze
	
	for i in range(HP_num):
		HP_textures[i].texture = HP_full_icon
	
	for i in range(HP_num, Global.MAXIMUM_HP_SPELL):
		HP_textures[i].texture = HP_icon
	
	for i in range(spell_num):
		spell_textures[i].texture = spell_full_icon
	
	for i in range(spell_num, Global.MAXIMUM_HP_SPELL):
		spell_textures[i].texture = spell_icon
	
	score_display.text = "%08d" % score
	graze_display.text = "%05d" % graze
