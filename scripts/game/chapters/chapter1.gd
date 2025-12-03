extends Chapter

func handle_chapter() -> void:
	var enemy_scene1: PackedScene = preload("res://scenes/entities/enemy1.tscn")
	var AI_resource1: AIResource = preload("res://resources/AI1.tres")
	spawn_enemy(enemy_scene1, Vector2(32, 32), 10, AI_resource1)
	await wait(0.5)
	spawn_enemy(enemy_scene1, Vector2(64, 32), 10, AI_resource1)
	await wait(0.5)
	spawn_enemy(enemy_scene1, Vector2(96, 32), 10, AI_resource1)
	await wait(2.0)
