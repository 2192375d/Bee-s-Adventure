extends Area2D

class_name Enemy

var actions: Array[Action]
var hp: int

func hit(damage: int) -> void:
	hp -= damage
	if hp <= 0:
		die()

func die() -> void:
	queue_free()

func setup(spawnpoint: Vector2, new_actions: Array[Action], new_hp: int) -> void:
	actions = new_actions
	hp = new_hp
	position = spawnpoint

func _ready() -> void:
	for action: Action in actions:
		@warning_ignore("redundant_await")
		await action.run()
	
	print("enemy: ", self , ", complete")
