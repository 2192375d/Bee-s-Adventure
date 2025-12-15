extends ActionResource

class_name ActionAttackSurround1

@export var attack_interval: float
#@export var shot_interval: float
@export var speed: float
@export var bullet_scene: PackedScene
@export var branch: int = 8

var attack_interval_timer: Timer
#var shot_interval_timer: Timer
var to_shoot: bool
var alternate: bool

func start_action() -> void:
	super.start_action()
	attack_interval_timer = get_timer()
	#shot_interval_timer = get_timer()
	
	attack_interval_timer.timeout.connect(_on_attack_interval_timer_timeout)
	
	to_shoot = false
	alternate = false
	actor.add_child(attack_interval_timer)
	#actor.add_child(shot_interval_timer)
	
	attack_interval_timer.start(attack_interval)

func _on_attack_interval_timer_timeout() -> void:
	to_shoot = true
	attack_interval_timer.start(attack_interval)

func update(_delta: float) -> void:
	
	if (!to_shoot):
		return
	
	to_shoot = false
	
	var offset: float = 0
	
	if alternate:
		offset = PI / branch
	
	var direction: float = (Global.get_bee().position - actor.position).angle()
	for i in range (0, branch):
		var bullet: Bullet = bullet_scene.instantiate()
		Global.get_game().add_child(bullet)
		bullet.set_bullet_with_angle(actor.position, 
		direction + i * PI/branch * 2 + offset, speed)
	
	alternate = !alternate
	attack_interval_timer.start(attack_interval)
	
