extends Chapter

@export var enemy_scene: PackedScene
@export var enemy_scene2: PackedScene
@export var AI_resource: AIResource
@export var AI_resource2: AIResource
@export var AI_resource3: AIResource

func handle_chapter() -> void:
	#640 * 736
	
	const HP: int = 70
	const HP2: int = 5
	
	spawn_enemy(enemy_scene, Vector2(128, 32), HP, AI_resource)
	spawn_enemy(enemy_scene, Vector2(Global.gameSizeX - 128, 32), HP, AI_resource)
	await wait(5.0)
	for i in range(0, 5):
		spawn_enemy(enemy_scene2, 
		Vector2(32, 32),
		HP2,
		AI_resource2
		)
		await wait(0.3)
	for i in range(0, 5):
		spawn_enemy(enemy_scene2, 
		Vector2(Global.gameSizeX - 32, 32),
		HP2,
		AI_resource3
		)
		await wait(0.3)
	
	await wait(1.0)
