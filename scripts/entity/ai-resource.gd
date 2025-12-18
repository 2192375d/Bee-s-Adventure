extends Resource

class_name AIResource

enum ENEMY_KILLED_SCORE {SCORE1, SCORE2, SCORE3}

@export var actions: Array[ActionResource]
@export var killed_score: ENEMY_KILLED_SCORE = ENEMY_KILLED_SCORE.SCORE2

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
