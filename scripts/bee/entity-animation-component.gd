extends Node

class_name EntityAnimationComponent

'''
ROTATE: rotate speed
'''
enum OPTIONS { ROTATE }

@export var actor: Enemy
@export var animation: AnimatedSprite2D

@export var options_dictionary: Dictionary[OPTIONS, Variant]

var _tween: Tween

func _ready() -> void:
	animation.self_modulate = Color(0.6, 0.6, 0.6, 1)

func rotate_animation(delta: float, speed: float) -> void:
	actor.rotate(speed * delta)

func shine_animation() -> void:
	if animation == null:
		return
	
	if _tween and _tween.is_running():
		_tween.kill()
	
	animation.modulate = Color(1.7, 1.7, 1.7, 1)
	
	_tween = create_tween()
	_tween.tween_property(animation, "modulate", Color(1,1,1,1), 0.06)


func _process(delta: float) -> void:
	if (OPTIONS.ROTATE in options_dictionary):
		rotate_animation(delta, options_dictionary[OPTIONS.ROTATE])
