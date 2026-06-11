extends Node

# async function, creates a new timer, waits for time_interval seconds
func wait(time_interval: float) -> void:
	await get_tree().create_timer(time_interval).timeout

func spawn_straight_bullet(
		spawnpoint: Vector2, 
		bullet_scene: PackedScene, 
		speed: float, 
		angle: float
	) -> void:
	assert(GameSession.game != null)
	
	var bullet: Bullet = bullet_scene.instantiate()
	bullet.setup(spawnpoint, speed, angle)
	GameSession.get_game().add_child(bullet)

func get_player_angle(current_position: Vector2) -> float:
	return (GameSession.get_player().position - current_position).angle()
