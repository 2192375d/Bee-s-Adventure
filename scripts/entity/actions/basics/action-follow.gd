extends ActionResource

class_name ActionFollow

@export var position_curve: Curve
@export var path_scene: PackedScene
@export var reverse: bool = false

var path: Path2D
var path_follow: PathFollow2D

func start_action() -> void:
	super.start_action()
	
	path = path_scene.instantiate()
	path.global_position = actor.global_position
	align_path_start(path)
	
	Global.game.get_tree().current_scene.add_child.call_deferred(path)
	
	if reverse:
		flip_curve_y(path.curve)
	
	path_follow = path.get_node("PathFollow2D")
	path_follow.progress = 0

func update(_delta: float) -> void:
	follow_path(position_curve, path_follow)

func flip_curve_y(curve: Curve2D) -> void:
	if !curve:
		return

	for i in curve.get_point_count():
		var p := curve.get_point_position(i)
		var in_h := curve.get_point_in(i)
		var out_h := curve.get_point_out(i)

		p.x = -p.x
		in_h.x = -in_h.x
		out_h.x = -out_h.x

		curve.set_point_position(i, p)
		curve.set_point_in(i, in_h)
		curve.set_point_out(i, out_h)
