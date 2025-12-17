extends ActionResource

class_name ActionFollow

@export var position_curve: Curve
@export var path_scene: PackedScene
@export var displacement: Vector2

var path: Path2D
var path_follow: PathFollow2D

func start_action() -> void:
	super.start_action()
	
	path = path_scene.instantiate()
	path.global_position = actor.global_position
	align_path()
	
	Global.game.get_tree().current_scene.add_child.call_deferred(path)
	
	path_follow = path.get_node("PathFollow2D")
	path_follow.progress = 0

func update(_delta: float) -> void:
	follow_path()

func follow_path() -> void:
	if (!path_follow):
		return
	var ratio = (timer.wait_time - timer.time_left) / duration # 0 to 1
	path_follow.progress_ratio = position_curve.sample(ratio)
	actor.global_position = path_follow.global_position

func align_path() -> void:
	if !path or !path.curve:
		return
	
	# Important: ensure we don't mutate a shared Curve2D resource
	var curve: Curve2D = path.curve.duplicate(true)
	path.curve = curve
	
	var n: int = curve.get_point_count()
	if n < 2:
		# Nothing meaningful to align/warp; just place the path at the actor.
		path.global_position = actor.global_position
		return
	
	# Template endpoints (local to the Path2D)
	var start_local: Vector2 = curve.get_point_position(0)
	var end_local: Vector2 = curve.get_point_position(n - 1)
	
	# Template displacement and desired displacement (A assumed origin, so B == end_position)
	var v: Vector2 = end_local - start_local
	var w: Vector2 = displacement
	
	var eps := 1e-5
	var v_len := v.length()
	var w_len := w.length()
	
	# Degenerate template: start/end are the same
	if v_len < eps:
		# Collapse to a straight "point" and force the last point to be w.
		for i in n:
			curve.set_point_position(i, Vector2.ZERO)
			curve.set_point_in(i, Vector2.ZERO)
			curve.set_point_out(i, Vector2.ZERO)
		curve.set_point_position(n - 1, w)
	
		path.global_position = actor.global_position
		return
	
	# Map v -> w using a single affine transform: translate-to-start, rotate, uniform-scale
	var angle_delta: float = w.angle() - v.angle()
	var scale: float = (w_len / v_len) if w_len >= eps else 0.0
	
	for i in n:
		# Positions are absolute points; handles are offsets from the point.
		var p: Vector2 = curve.get_point_position(i) - start_local
		var in_h: Vector2 = curve.get_point_in(i)
		var out_h: Vector2 = curve.get_point_out(i)
	
		p = p.rotated(angle_delta) * scale
		in_h = in_h.rotated(angle_delta) * scale
		out_h = out_h.rotated(angle_delta) * scale
	
		curve.set_point_position(i, p)
		curve.set_point_in(i, in_h)
		curve.set_point_out(i, out_h)
	
	# Hard-snap endpoints for numerical certainty
	curve.set_point_position(0, Vector2.ZERO)
	curve.set_point_position(n - 1, w)
	
	# Put the warped curve's start at the actor's start (A)
	path.global_position = actor.global_position
