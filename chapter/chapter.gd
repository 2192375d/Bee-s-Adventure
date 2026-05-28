class_name Chapter

extends Resource

@export var actions: Array[Action]

func run() -> void:
	for action: Action in actions:
		@warning_ignore("redundant_await")
		await action.run()
	
	print("chapter: ", self , ", complete")
