extends Action

class_name ActionRepeatAction

@export var action: Action
@export var delay: float
@export var number_of_repeats: int

func run() -> void:
	assert(action != null)
	
	for i in range(number_of_repeats):
		action.setup(actor)
		@warning_ignore("redundant_await")
		await action.run()
		await Utils.wait(delay)
