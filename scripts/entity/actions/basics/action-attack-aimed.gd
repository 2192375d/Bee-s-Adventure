extends ActionResource

class_name ActionAimedAttack

@export var interval: float
@export var speed: float
@export var bullet_scene: PackedScene
var interval_timer: Timer
var to_shoot: bool

func start_action() -> void:
	#print(actor, ": action started")
	super.start_action()
	interval_timer = get_timer()
	interval_timer.timeout.connect(_on_interval_timer_timeout)
	
	to_shoot = false
	actor.add_child(interval_timer)
	interval_timer.start(interval)

func _on_interval_timer_timeout() -> void:
	to_shoot = true
	interval_timer.start(interval)

func update(_delta: float) -> void:
	
	if (!to_shoot):
		return
	
	to_shoot = false
	var bullet: Bullet = bullet_scene.instantiate()
	var direction_vector: Vector2 = (Global.get_bee().position - actor.position).normalized()
	Global.get_game().add_child(bullet)
	bullet.set_bullet(actor.position, direction_vector, speed)
