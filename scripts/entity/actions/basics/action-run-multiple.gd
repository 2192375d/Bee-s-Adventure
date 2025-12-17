# for this action, the duration is based on individual actions' duration,
# but if it exceeds this action's duration, it will be capped at duration

extends ActionResource

class_name ActionRunMultiple

@export var actions: Array[ActionResource]

func start_action() -> void:
	var total_time: float = actions[0].duration
	
	for action in actions:
		if action.duration > total_time:
			total_time = action.duration
	
	if total_time < duration:
		duration = total_time
	
	super.start_action()
	
	for action in actions:
		action.actor = actor
		action.start_action()

func update(delta: float) -> void:
	for action in actions:
		action.update(delta)
