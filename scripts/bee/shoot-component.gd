extends Node

class_name ShootComponent

@export var bullet_scene: PackedScene
@export var shoot_cd_timer: Timer

var can_shoot: bool = true

func handle_shooting() -> void:
	if (!can_shoot):
		return
	
	var bee_position: Vector2 = Global.get_bee().position
	
	for i in range (-24, 24 + 1, 16):
		var bee_bullet: BeeBullet = bullet_scene.instantiate()
		bee_bullet.setup(bee_position + Vector2(i, 0))
		Global.get_game().add_child(bee_bullet)
	
	can_shoot = false
	shoot_cd_timer.start()


func _on_timer_timeout() -> void:
	can_shoot = true
