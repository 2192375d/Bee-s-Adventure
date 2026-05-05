@abstract class_name Action

extends Resource

var owner: Node2D

@abstract func run() -> void

func setup(new_owner: Node2D) -> void:
	owner = new_owner
