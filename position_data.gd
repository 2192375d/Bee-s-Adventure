@tool
extends Resource

class_name PositionData

enum PositionMode {
	GRID = 0,
	ABSOLUTE = 1,
}

@export var position_mode: PositionMode = PositionMode.GRID:
	set(value):
		position_mode = value
		notify_property_list_changed()

@export_range(-2, 17, 1, "prefer_slider") var grid_x: int = 1
@export_range(-2, 17, 1, "prefer_slider") var grid_y: int = 1
@export var absolute_position: Vector2 = Vector2.ZERO

func _validate_property(property: Dictionary) -> void:
	if property.name in ["grid_x", "grid_y"] and position_mode != PositionMode.GRID:
		property.usage = PROPERTY_USAGE_NO_EDITOR
	elif property.name == "absolute_position" and position_mode != PositionMode.ABSOLUTE:
		property.usage = PROPERTY_USAGE_NO_EDITOR

func get_position() -> Vector2:
	if position_mode == PositionMode.GRID:
		return Vector2(
			Constants.gamesize_x / 16.0 * float(grid_x),
			Constants.gamesize_y / 16.0 * float(grid_y)
		)
	if position_mode == PositionMode.ABSOLUTE:
		return absolute_position

	return Vector2.ZERO
