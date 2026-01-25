extends ActionResource

class_name ActionAttackSide

@export var interval: float
@export var speed: float
@export var angle: float #in pi
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
	var direction: float = (Global.get_bee().position - actor.position).angle()
	
	var bullet1: Bullet = bullet_scene.instantiate()
	Global.get_game().add_child(bullet1)
	bullet1.set_bullet_with_angle(actor.position, direction + angle, speed)
	var bullet2: Bullet = bullet_scene.instantiate()
	Global.get_game().add_child(bullet2)
	bullet2.set_bullet_with_angle(actor.position, direction - angle, speed)
