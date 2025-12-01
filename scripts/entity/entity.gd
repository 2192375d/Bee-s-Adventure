@abstract class_name Entity extends Area2D

var ai_resource: AIResource

func in_border() -> bool:
	var half_w: float = 0
	var half_h: float = 0
	
	var collision_shape: CollisionShape2D = get_node_or_null("CollisionShape2D")
	
	if (collision_shape):
		half_w = collision_shape.shape.extents.x
		half_h = collision_shape.shape.extents.y
	
	if (
		position.x - half_w >= 0
		and position.x + half_w <= Global.gameSizeX
		and position.y - half_h >= 0
		and position.y + half_h <= Global.gameSizeY):
		return true
	return false
