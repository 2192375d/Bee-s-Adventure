extends Area2D

class_name BeeBullet

@export var animation: AnimatedSprite2D

@export var speed: float = 700
@export var damage: int = 3
var direction: float = 0.0

func _ready() -> void:
	animation.play("default")

func setup(spawnpoint: Vector2, new_direction: float) -> void:
	position = spawnpoint
	direction = new_direction
	rotate(-direction)

func _on_area_entered(area: Area2D) -> void:
	if area is Enemy:
		area.hit(3)
		queue_free()

func _physics_process(delta: float) -> void:
	position += speed * delta * Vector2(cos(direction), -sin(direction))
	
	if !Constants.in_game_border(position):
		queue_free()
