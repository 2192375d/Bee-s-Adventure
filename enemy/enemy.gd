extends Area2D

class_name Enemy

var actions: Array[Action]
var hp: int

func setup(spawnpoint: Vector2, new_actions: Array[Action], new_hp: int) -> void:
	actions = new_actions
	hp = new_hp
	position = spawnpoint

func _ready() -> void:
	var context: ActionContext = ActionContext.new()
	context.owner = self
	
	for action: Action in actions:
		@warning_ignore("redundant_await")
		await action.run(context)
	
	print("enemy: ", self , ", action complete")
