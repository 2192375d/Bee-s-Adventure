@abstract class_name Chapter

extends Node

@export var timer: Timer

@abstract func handle_chapter() -> void

func spawn_enemy(enemy_scene: PackedScene, spawn_point: Vector2, hp: int, ai_resource: AIResource) -> void:
	
	var enemy: Enemy = enemy_scene.instantiate()
	var ai_copy: AIResource = ai_resource.duplicate_deep(Resource.DEEP_DUPLICATE_ALL)
	
	enemy.set_enemy(spawn_point, hp, ai_copy)
	Global.game.add_child(enemy)

func wait(seconds: float) -> void:
	timer.wait_time = seconds
	timer.start()
	await timer.timeout
