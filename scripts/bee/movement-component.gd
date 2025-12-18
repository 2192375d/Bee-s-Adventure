extends Node

class_name MovementComponent

var actor: Player
@export var speed: float
@export var focus_speed: float

func _ready() -> void:
	actor = Global.get_bee()

func handle_movement (move_intent: Vector2i) -> void:
	if (move_intent == Vector2i.ZERO):
		actor.velocity = Vector2.ZERO
		return

	var v: Vector2 = move_intent
	v = v.normalized()
	
	if Input.is_action_pressed("ui_shift"):
		actor.velocity = v * focus_speed
	else:
		actor.velocity = v * speed
