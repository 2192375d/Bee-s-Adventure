extends Chapter

func handle_chapter() -> void:
	var enemy_scene1: PackedScene = preload("res://scenes/entities/enemy1.tscn")
	var AI_resource1: AIResource = preload("res://resources/enemy1AI.tres")
	var AI_resource1_rev: AIResource = preload("res://resources/enemy1AI-rev.tres")
	
	#640 * 736
	
	const GAP_X: int = 64
	const GAP_Y: int = 16
	
	for i in range(0, 4):
		spawn_enemy(enemy_scene1, Vector2(32 + i * GAP_X, 32 + i * GAP_Y), 10, AI_resource1)
		await wait(0.75)
		spawn_enemy(enemy_scene1, Vector2(Global.gameSizeX -32 - i * GAP_X, 32 + i * GAP_Y), 
		10, AI_resource1_rev)
		await wait(0.75)
	await wait(2.0)
