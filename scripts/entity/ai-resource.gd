extends Resource

class_name AIResource
@export var actions: Array[ActionResource]
#var actor: Enemy

var currentAction: ActionResource
signal actions_complete

func start_AI() -> void:
	for action: ActionResource in actions:
		action.start_action()
		currentAction = action
		await action.timer.timeout
	actions_complete.emit()

func update(_delta: float) -> void:
	currentAction.update(_delta)
