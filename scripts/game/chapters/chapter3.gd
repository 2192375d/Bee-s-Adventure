extends Chapter

@export var enemy_scene1: PackedScene
@export var enemy_scene2: PackedScene
@export var AI_resource1: AIResource
@export var AI_resource2: AIResource
@export var AI_resource3: AIResource

func handle_chapter() -> void:
	#640 * 736
	
	const HP1: int = 5
	const HP2: int = 140
	
	spawn_enemy(enemy_scene2, Vector2(Global.gameSizeX / 2, 32), HP2, AI_resource3)
	await wait(1.0)
	for i in range(0, 10):
		spawn_enemy(enemy_scene1, 
			Vector2(Global.gameSizeX - 128, 32),
			HP1,
			AI_resource1
		)
		await wait(0.20)
		spawn_enemy(enemy_scene1,
			Vector2(128, 32),
			HP1,
			AI_resource2
		)
		await wait(0.2)
	
	await wait(2.0)
