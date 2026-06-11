extends Action

class_name ActionRunParallel

@export var actions: Array[Action]


func run() -> void:
	assert(actor != null)
	
	for action: Action in actions:
		assert(action != null)
		action.setup(actor)
		action.run()
