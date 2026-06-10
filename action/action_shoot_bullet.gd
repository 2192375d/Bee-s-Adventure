@tool
extends Action
class_name ActionShootBullet

enum Mode {
	FIXED_DIRECTION = 0,
	CONTEXT_DIRECTION = 1,
	PLAYER_DIRECTION = 2,
}

@export var bullet_scene: PackedScene
@export var mode: Mode = Mode.FIXED_DIRECTION:
	set(value):
		mode = value
		notify_property_list_changed()
@export var angle: float = PI / 2
@export var speed: float = 200


func _validate_property(property: Dictionary) -> void:
	if property.name == "angle" and mode != Mode.FIXED_DIRECTION:
		property.usage = PROPERTY_USAGE_NO_EDITOR


func run(context: ActionContext) -> void:
	assert(context.owner != null)
	
	var bullet: Bullet = bullet_scene.instantiate()
	bullet.setup(context.owner.position, speed, _get_direction(context))
	GameSession.get_game().add_child(bullet)


func _get_direction(context: ActionContext) -> float:
	if mode == Mode.CONTEXT_DIRECTION:
		assert(not is_nan(context.direction))
		return context.direction
	if mode == Mode.PLAYER_DIRECTION:
		var difference: Vector2 = GameSession.get_player().position - context.owner.position
		return difference.angle()
	return angle
