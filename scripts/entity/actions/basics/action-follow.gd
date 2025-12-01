extends ActionResource

class_name ActionFollow

@export var speed_curve: Curve
@export var path_scene: PackedScene

var path: Path2D
var path_follow: PathFollow2D

func start_action() -> void:
	super.start_action()
	
	path = path_scene.instantiate()
	path.global_position = actor.global_position
	align_path_start(path)
	
	Global.game.get_tree().current_scene.add_child.call_deferred(path)
	path_follow = path.get_node("PathFollow2D")
	path_follow.progress = 0

func update(_delta: float) -> void:
	follow_path(speed_curve, path_follow)
