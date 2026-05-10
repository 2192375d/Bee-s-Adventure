extends Area2D

class_name HitboxDot

func _on_area_entered(area: Area2D) -> void:
	if area is Bullet:
		print("player hit!")
