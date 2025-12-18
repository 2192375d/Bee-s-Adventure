extends CharacterBody2D

class_name Player

@export var movement_component: MovementComponent
@export var animation_component: AnimationComponent
@export var shoot_component: ShootComponent

@export var disappear_timer: Timer
@export var invincibility_timer: Timer

@export var disappear_time: float
@export var invincible_time: float # invincible time starts after disappeared

@export var hitbox_dot: Sprite2D
@export var spawn_point: Vector2

@onready var invincible: bool = false

func _ready() -> void:
	position = spawn_point
	show()
	hitbox_dot.hide()
	
	Global.get_game().player_hit.connect(_on_player_hit)

func _process(_delta: float) -> void:
	var move_indent = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	movement_component.handle_movement(move_indent)
	animation_component.handle_animation(move_indent)
	
	if Input.is_action_pressed("ui_shoot") && visible:
		shoot_component.handle_shooting()
	
	if Input.is_action_pressed("ui_shift"):
		hitbox_dot.show()
	
	if Input.is_action_just_released("ui_shift"):
		hitbox_dot.hide()
	
	move_and_slide()

func _on_player_hit() -> void:
	invincible = true
	hide()
	disappear_timer.start(disappear_time)

func _on_disappeartimer_timeout() -> void:
	position = spawn_point
	show()
	invincibility_timer.start(invincible_time)

func _on_invincibilitytimer_timeout() -> void:
	invincible = false
	animation_component.animation.show()
