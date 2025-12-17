extends Chapter

@export var enemy_scene: PackedScene
@export var AI_resources: Array[AIResource] #expect 8 elements


func handle_chapter() -> void:
	#640 * 736
	
	const GAP_X: int = 64
	const GAP_Y: int = 32
	
	const HP: int = 15
	
	for i in range(0, 3):
		spawn_enemy(enemy_scene, Vector2(32 + i * GAP_X, 32 + i * GAP_Y), 
		HP, AI_resources[2 * i])
		await wait(0.5)
		spawn_enemy(enemy_scene, Vector2(Global.gameSizeX -32 - i * GAP_X, 32 + i * GAP_Y), 
		HP, AI_resources[2 * i + 1])
		await wait(0.75)
	await wait(4.0)
