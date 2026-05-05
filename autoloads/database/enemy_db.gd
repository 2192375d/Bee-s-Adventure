extends Node

enum EnemyEnum {
	BASE = 0
}

var enemy_enum_dictionary: Dictionary[EnemyEnum, PackedScene] = {
	EnemyEnum.BASE: load("uid://cl8xwiou2wf3k")
}

func get_enemy_scene(enemy_enum: EnemyEnum) -> PackedScene:
	return enemy_enum_dictionary[enemy_enum]
