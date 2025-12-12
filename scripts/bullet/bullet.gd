extends Area2D

class_name Bullet

var direction_vector: Vector2
var speed: float

func set_bullet(spawnpoint: Vector2, new_direction_vector: Vector2, new_speed: float) -> void:
	position = spawnpoint
	direction_vector = new_direction_vector
	speed = new_speed
	rotate(direction_vector.angle())

func _physics_process(delta: float) -> void:
	position += speed * direction_vector * delta
	
	if position.x < 0 or\
	position.x > Global.gameSizeX or\
	position.y < 0 or\
	position.y > Global.gameSizeY:
		queue_free()
