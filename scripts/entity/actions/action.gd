@abstract class_name ActionResource
extends Resource

@export var duration: float

var timer: Timer
var actor: Entity

var entities: Array[Entity]

func start_action() -> void:
	
	timer.autostart = false
	timer.one_shot = true
	timer.start(duration)

@abstract func update(_delta: float) -> void

func follow_path(speed_curve: Curve, path_follow: PathFollow2D) -> void:
	if (!path_follow):
		return
	var ratio = (timer.wait_time - timer.time_left) / duration # 0 to 1
	path_follow.progress_ratio = speed_curve.sample(ratio)
	actor.global_position = path_follow.global_position

func align_path_start(path: Path2D):
	var curve := path.curve
	var local_start := curve.get_point_position(0)
	var global_start := path.to_global(local_start)
	path.global_position += actor.global_position - global_start
