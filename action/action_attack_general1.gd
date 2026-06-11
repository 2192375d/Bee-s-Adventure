extends Action


class_name ActionAttackGeneral1

@export var central_bullet_scene: PackedScene
@export var side_bullet_scene: PackedScene

@export var delay1: float # for central
@export var speed1: float # for side
@export var delay2: float
@export var speed2: float
@export var number_of_repeats: int # on central attack

var player_angle: float

var action_complete: bool = false

func central_attack() -> void:
	const ANGLE = PI / 16
	
	for i in range(number_of_repeats):
		Utils.spawn_straight_bullet(actor.position, central_bullet_scene, speed1, player_angle + ANGLE)
		Utils.spawn_straight_bullet(actor.position, central_bullet_scene, speed1, player_angle - ANGLE)
		Utils.spawn_straight_bullet(actor.position, central_bullet_scene, speed1, player_angle)
		await Utils.wait(delay1)
	
	action_complete = true

func side_attack() -> void:
	const ANGLE = PI / 8
	
	while !action_complete:
		Utils.spawn_straight_bullet(actor.position, side_bullet_scene, speed2, player_angle + ANGLE)
		Utils.spawn_straight_bullet(actor.position, side_bullet_scene, speed2, player_angle - ANGLE)
		await Utils.wait(delay2)

func run() -> void:
	action_complete = false
	player_angle = Utils.get_player_angle(actor.position)
	assert(actor != null)
	
	
	side_attack()
	await central_attack()
