extends Action

class_name ActionRepeatAction

@export var action: Action
@export var delay: float
@export var number_of_repeats: int

func run(context: ActionContext) -> void:
	assert(action != null)
	
	for i in range(number_of_repeats):
		@warning_ignore("redundant_await")
		await action.run(context)
		await Utils.wait(delay)
