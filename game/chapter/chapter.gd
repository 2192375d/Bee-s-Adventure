class_name Chapter

extends Resource

@export var actions: Array[Action]

func run() -> void:
	print("chapter: ", self, " started")
	var context: ActionContext = ActionContext.new()
	
	for action: Action in actions:
		@warning_ignore("redundant_await")
		await action.run(context)
	
	print("chatper: ", self, " ended")
