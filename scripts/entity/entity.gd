@abstract class_name Entity extends Area2D

var ai_resource: AIResource
var timer: Timer

func _ready():
	#ai_resource.actor = self
	for action in ai_resource.actions:
		action.actor = self
		action.timer = timer
	#shape = $CollisionShape2D.shape
	ai_resource.start_AI()

@abstract func _on_actions_complete() -> void
