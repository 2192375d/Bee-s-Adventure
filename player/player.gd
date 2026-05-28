extends CharacterBody2D

class_name Player

@export var speed: float = 280.0
@export var focus_speed: float = 80.0
@export var focus_deceleration: float = 2400.0
@export var spawnpoint: PositionData

@export_group("bullet")
@export var bullet_offset: float
@export var bullet_scene: PackedScene
@export var bullet_timer: Timer

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
	
	if Input.is_action_pressed("bullet") && bullet_timer.is_stopped():
		var bullet1: BeeBullet = bullet_scene.instantiate()
		var bullet2: BeeBullet = bullet_scene.instantiate()
		var bullet3: BeeBullet = bullet_scene.instantiate()
		var bullet4: BeeBullet = bullet_scene.instantiate()
		var bullet5: BeeBullet = bullet_scene.instantiate()
		var bullet6: BeeBullet = bullet_scene.instantiate()
		bullet1.setup(position + bullet_offset * Vector2(-0.4, -0.4), 2 * PI / 3)
		bullet2.setup(position + bullet_offset * Vector2(-1.5, -0.7), PI / 2)
		bullet3.setup(position + bullet_offset * Vector2(1.5, -0.7), PI / 2)
		bullet4.setup(position + bullet_offset * Vector2(0.4, -0.4), PI / 3)
		bullet5.setup(position + bullet_offset * Vector2(-4.5, -0.7), PI / 2)
		bullet6.setup(position + bullet_offset * Vector2(4.5, -0.7), PI / 2)
		GameSession.get_game().add_child(bullet1)
		GameSession.get_game().add_child(bullet2)
		GameSession.get_game().add_child(bullet3)
		GameSession.get_game().add_child(bullet4)
		GameSession.get_game().add_child(bullet5)
		GameSession.get_game().add_child(bullet6)
		
		bullet_timer.start()
	
	move_and_slide()
