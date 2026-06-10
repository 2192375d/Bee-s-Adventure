extends Action

class_name ActionModifyContext

@export var action: Action

func run(context: ActionContext) -> void:
	assert(action != null)
	assert(context.owner != null)
	
	var child_context: ActionContext = context.copy()
	child_context.direction = _get_direction(context)
	
	@warning_ignore("redundant_await")
	await action.run(child_context)


func _get_direction(context: ActionContext) -> float:
	var difference: Vector2 = GameSession.get_player().position - context.owner.position
	return difference.angle()
