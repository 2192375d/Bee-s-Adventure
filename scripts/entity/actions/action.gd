@abstract class_name ActionResource
extends Resource

@export var duration: float

var timer: Timer
var actor: Entity

func start_action() -> void:
	timer = get_timer()
	actor.add_child(timer)
	timer.start(duration)

@abstract func update(_delta: float) -> void

func get_timer() -> Timer:
	var new_timer: Timer = Timer.new()
	new_timer.autostart = false
	new_timer.one_shot = true
	return new_timer
