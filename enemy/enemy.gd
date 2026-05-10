extends Area2D

class_name Enemy

var actions: Array[Action]
var hp: int

func setup(spawnpoint: Vector2, new_actions: Array[Action], new_hp: int) -> void:
	actions = new_actions
	hp = new_hp
	position = spawnpoint

func run() -> void:
	
	for action: Action in actions:
		action.setup(self)
		@warning_ignore("redundant_await")
		await action.run()
	
	print("enemy: ", self , ", action complete")
