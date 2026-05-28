extends Action

class_name ActionSpawnEnemy

enum SpawnpointMode {
	GRID = 0,
	ABSOLUTE = 1
}

@export var enemy_scene_enum: EnemyDB.EnemyEnum
@export var spawnpoint: PositionData = PositionData.new()
@export var actions: Array[Action]
@export var hp: int = 30

func run() -> void:
	var enemy_scene: PackedScene = EnemyDB.get_enemy_scene(enemy_scene_enum)
	var enemy: Enemy = enemy_scene.instantiate()
	enemy.setup(spawnpoint.get_position(), actions, hp)
	GameSession.get_game().add_child(enemy)
