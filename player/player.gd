extends CharacterBody2D

class_name Player

@export var speed: float = 280.0
@export var focus_speed: float = 80.0
@export var focus_deceleration: float = 2400.0
@export var spawnpoint: PositionData

@export var animation: AnimatedSprite2D

func _ready() -> void:
	position = spawnpoint.get_position()

func _physics_process(delta: float) -> void:
	var direction_vector: Vector2 = Input.get_vector("left", "right", "up", "down").normalized()

	if direction_vector == Vector2.ZERO:
		velocity = Vector2.ZERO
	elif Input.is_action_pressed("focus") and velocity.length() > focus_speed:
		var focus_velocity: Vector2 = direction_vector * focus_speed
		velocity = velocity.move_toward(focus_velocity, focus_deceleration * delta)
	else:
		var current_speed: float = speed
		if Input.is_action_pressed("focus"):
			current_speed = focus_speed
		velocity = current_speed * direction_vector

	move_and_slide()

func _process(_delta: float) -> void:
	animation.play("default")
	if Input.is_action_pressed("left"):
		animation.play("left")
	if Input.is_action_pressed("right"):
		animation.play("right")
