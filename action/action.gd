@abstract class_name Action

extends Resource

var actor: Node2D

@abstract func run() -> void

func setup(new_actor: Node2D) -> void:
	actor = new_actor
