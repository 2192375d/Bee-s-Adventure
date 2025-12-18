extends Node

class_name AnimationComponent
@export var animation: AnimatedSprite2D

enum Facing {DEFAULT, LEFT, RIGHT} 

@onready var facing: Facing = Facing.DEFAULT
var bee: Player

func _ready() -> void:
	bee = Global.get_bee()

func handle_animation (move_intent: Vector2i) -> void:
	if bee.invincible:
		animation.visible = !animation.visible
	
	set_animation_enum(move_intent)
	animation.play(get_animation_string())

func get_animation_string () -> String:
	var animation_name: String
	animation_name = ""
	
	match facing:
		Facing.DEFAULT: animation_name = "default"
		Facing.LEFT: animation_name = "left"
		Facing.RIGHT: animation_name = "right"
	
	if Input.is_action_pressed("ui_down"):
		return "down-" + animation_name
	
	return animation_name

func set_animation_enum (move_intent: Vector2i) -> void:
	facing = Facing.DEFAULT
	
	if move_intent[0] < 0:
		facing = Facing.LEFT
		return
	
	if move_intent[0] > 0:
		facing = Facing.RIGHT
		return
