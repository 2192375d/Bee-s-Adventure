extends Chapter

@export var enemy_scene1: PackedScene
@export var enemy_scene2: PackedScene
@export var AI_resource1: AIResource
@export var AI_resource2: AIResource

func handle_chapter() -> void:
	#640 * 736
	
	const HP1: int = 5
	const HP2: int = 40
	
	spawn_enemy(enemy_scene2, Vector2(Global.gameSizeX - 64, 128), HP2, AI_resource2)
	await wait(2.0)
	for i in range(0, 5):
		spawn_enemy(enemy_scene1, 
		Vector2(128, 32),
		HP1,
		AI_resource1
		)
		await wait(0.3)
	
	await wait(5.0)
