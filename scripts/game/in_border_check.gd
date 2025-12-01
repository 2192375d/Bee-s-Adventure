extends Area2D

func _ready() -> void:
	area_exited.connect(_on_area_exited)
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D):
	if area is Enemy:
		area.show()

func _on_area_exited(area: Area2D):
	if area is Enemy:
		area.hide()
