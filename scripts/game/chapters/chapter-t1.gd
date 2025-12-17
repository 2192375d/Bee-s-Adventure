extends Chapter

@export var enemy_scene1: PackedScene
@export var AI_resource1: AIResource
#@export var AI_resource1_rev: AIResource

func handle_chapter() -> void:
	#640 * 736
	const HP: int = 15
	
	spawn_enemy(enemy_scene1, Vector2(32, 32), HP, AI_resource1)
	await wait(2.0)
