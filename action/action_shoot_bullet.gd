extends Action
class_name ActionShootBullet

@export var bullet_scene: PackedScene
@export var angle: float = PI / 2
@export var speed: float = 200


func run() -> void:
	assert(owner != null)
	
	var bullet: Bullet = bullet_scene.instantiate()
	bullet.setup(owner.position, speed, angle)
	GameSession.get_game().add_child(bullet)
