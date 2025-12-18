extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area is Bullet:
		if area.grazed == false:
			area.grazed = true
			Global.get_game().stats_component.increment_graze()
			Global.get_game().stats_component.add_score(Global.GRAZE_SCORE)
