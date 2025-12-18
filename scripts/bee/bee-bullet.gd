extends Area2D

class_name BeeBullet

@export var speed: float
var radius: float = 0

func _ready():
	area_entered.connect(on_area_entered)

func setup(new_position: Vector2) -> void:
	position = new_position
	var collision_shape: CollisionShape2D = get_node_or_null("CollisionShape2D")
	
	if (collision_shape):
		radius = collision_shape.shape.radius

func _physics_process(delta: float) -> void:
	position.y -= speed * delta
	
	if (position.x + radius < 0
		or position.x - radius > Global.gameSizeX
		or position.y + radius < 0
		or position.y - radius > Global.gameSizeY):
		queue_free()

func on_area_entered(area: Area2D) -> void:
	if area is Enemy:
		area.get_hit(Global.PLAYER_BULLET_DAMAGE)
		queue_free()
