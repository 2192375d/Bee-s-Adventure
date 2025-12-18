extends Node

class_name EntityAnimationComponent

'''
ROTATE: rotate speed: float
PLAY_ANIMATION: animation to play: String
'''
enum OPTIONS { ROTATE, PLAY_ANIMATION }

@export var actor: Enemy
@export var animation: AnimatedSprite2D

@export var options_dictionary: Dictionary[OPTIONS, Variant]

func _ready() -> void:
	animation.self_modulate = Color(0.6, 0.6, 0.6, 1)

func rotate_animation(delta: float, speed: float) -> void:
	actor.rotate(speed * delta)

func play_animation(animation_name: String) -> void:
	animation.play(animation_name)

var _tween: Tween

func shine_animation() -> void:
	
	if _tween and _tween.is_running():
		_tween.kill()
	
	animation.modulate = Color(1.7, 1.7, 1.7, 1)
	
	_tween = create_tween()
	_tween.tween_property(animation, "modulate", Color(1,1,1,1), 0.06)


func _process(delta: float) -> void:
	if (OPTIONS.ROTATE in options_dictionary):
		rotate_animation(delta, options_dictionary[OPTIONS.ROTATE])
	if (OPTIONS.PLAY_ANIMATION in options_dictionary):
		play_animation(options_dictionary[OPTIONS.PLAY_ANIMATION])
