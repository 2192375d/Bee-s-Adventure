extends CharacterBody2D

class_name Player

@export var movement_component: MovementComponent
@export var animation_component: AnimationComponent
@export var shoot_component: ShootComponent

@export var hitbox_dot: Sprite2D
@export var spawn_point: Vector2

func _ready() -> void:
	position = spawn_point
	hitbox_dot.hide()

func _process(_delta: float) -> void:
	var move_indent = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	movement_component.handle_movement(move_indent)
	animation_component.handle_animation(move_indent)
	
	if Input.is_action_pressed("ui_shoot"):
		shoot_component.handle_shooting()
	
	if Input.is_action_pressed("ui_shift"):
		hitbox_dot.show()
	
	if Input.is_action_just_released("ui_shift"):
		hitbox_dot.hide()
	
	move_and_slide()
