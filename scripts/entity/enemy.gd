extends Entity

class_name Enemy
var animation_component: EntityAnimationComponent

var hp: int

var half_w: float = 0
var half_h: float = 0

var complete: bool = false

func _ready() -> void:
	super()
	ai_resource.actions_complete.connect(_on_actions_complete)

func set_enemy(spawnpoint: Vector2, 
			   new_hp: int, 
			   new_ai_resource: AIResource,
			   ) -> void:
	ai_resource = new_ai_resource
	position = spawnpoint
	hp = new_hp
	#timer = $Timer
	animation_component = $EntityAnimationComponent
	
	var collision_shape: CollisionShape2D = get_node_or_null("CollisionShape2D")
	
	if (collision_shape):
		half_w = collision_shape.shape.extents.x
		half_h = collision_shape.shape.extents.y

func _process(delta: float):
	if !complete:
		ai_resource.update(delta)
	
	if (in_border()):
		show()
	else:
		hide()

func _on_actions_complete() -> void:
	complete = true
	if (!in_border()):
		self.queue_free()

func in_border() -> bool:
	if (
		position.x - half_w >= 0
		and position.x + half_w <= Global.gameSizeX
		and position.y - half_h >= 0
		and position.y + half_h <= Global.gameSizeY):
		return true
	return false

func get_hit(damage: int) -> void:
	animation_component.shine_animation()
	hp -= damage
	if hp <= 0.0:
		die()

func die() -> void:
	var sprite: AnimatedSprite2D = $AnimatedSprite2D
		
	var corpse := sprite.duplicate() as AnimatedSprite2D
	
	corpse.transform = transform
	
	corpse.modulate       = sprite.modulate
	corpse.self_modulate  = sprite.self_modulate
	corpse.sprite_frames  = sprite.sprite_frames
	corpse.animation      = sprite.animation
	corpse.frame          = sprite.frame
	
	get_parent().add_child(corpse)
	
	var tw := corpse.create_tween()
	tw.set_parallel(true)
	
	var start_pos := corpse.global_position
	var end_pos := start_pos + Vector2(0, 100)
	tw.tween_property(corpse, "global_position", end_pos, 0.7)\
	.set_trans(Tween.TRANS_QUAD)\
	.set_ease(Tween.EASE_OUT)
	
	tw.tween_property(corpse, "modulate", Color(0, 0, 0, 0), 0.7)
	tw.finished.connect(func(): corpse.queue_free())
	
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player-hitbox") && !Global.get_bee().invincible:
		Global.get_game().player_hit.emit()
