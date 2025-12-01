extends Area2D

func _ready() -> void:
	area_exited.connect(_on_area_exited)

func _on_area_exited(area: Area2D):
	if area is Enemy:
		area.queue_free()
