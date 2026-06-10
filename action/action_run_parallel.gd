extends Action

class_name ActionRunParallel

@export var actions: Array[Action]


func run(context: ActionContext) -> void:
	for action: Action in actions:
		assert(action != null)
		action.run(context)
