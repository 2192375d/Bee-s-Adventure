extends Area2D

class_name Bullet

var direction_vector: Vector2
var speed: float

var grazed: bool = false

func set_bullet(spawnpoint: Vector2, new_direction_vector: Vector2, new_speed: float) -> void:
	position = spawnpoint
	direction_vector = new_direction_vector
	speed = new_speed
	rotate(direction_vector.angle())
	
	add_to_group("enemy-bullet")

func set_bullet_with_angle(spawnpoint: Vector2, direction: float, new_speed: float) -> void:
	position = spawnpoint
	direction_vector = Vector2(cos(direction), sin(direction))
	speed = new_speed
	rotate(direction)

func _physics_process(delta: float) -> void:
	position += speed * direction_vector * delta
	
	if position.x < 0 or\
	position.x > Global.gameSizeX or\
	position.y < 0 or\
	position.y > Global.gameSizeY:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player-hitbox") && !Global.get_bee().invincible:
		Global.get_game().player_hit.emit()
