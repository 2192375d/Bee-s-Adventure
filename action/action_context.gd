class_name ActionContext

extends RefCounted

var owner: Node2D
var direction: float = NAN


func copy() -> ActionContext:
	var context: ActionContext = ActionContext.new()
	context.owner = owner
	context.direction = direction
	return context
