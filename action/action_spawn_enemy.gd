extends Action

enum SpawnpointMode {
	GRID = 0,
	ABSOLUTE = 1
}

@export var enemy_scene: PackedScene
@export var spawnpoint: PositionData
@export var actions: Array[Action]
@export var hp: int

func run() -> void:
	var enemy: Enemy = enemy_scene.instantiate()
	enemy.setup(spawnpoint.get_position(), actions, hp)
	GameSession.get_game().add_child(enemy)
