extends Area2D

class_name Bullet

@export var speed: float = 80
@export var direction: float = PI


func setup(spawnpoint: Vector2, new_speed: float, new_direction: float) -> void:
	position = spawnpoint
	speed = new_speed
	direction = new_direction

func _physics_process(delta: float) -> void:
	position.x += speed * delta * cos(direction)
	position.y += speed * delta * sin(direction)
	rotation = direction
