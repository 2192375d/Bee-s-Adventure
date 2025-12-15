extends Chapter

@export var enemy_scene1: PackedScene
@export var AI_resource1: AIResource
@export var AI_resource1_rev: AIResource


func handle_chapter() -> void:
	#640 * 736
	
	const GAP_X: int = 64
	const GAP_Y: int = 16
	
	const HP: int = 15
	
	for i in range(0, 4):
		spawn_enemy(enemy_scene1, Vector2(32 + i * GAP_X, 32 + i * GAP_Y), 
		HP, AI_resource1)
		await wait(0.75)
		spawn_enemy(enemy_scene1, Vector2(Global.gameSizeX -32 - i * GAP_X, 32 + i * GAP_Y), 
		HP, AI_resource1_rev)
		await wait(0.75)
	await wait(2.0)
