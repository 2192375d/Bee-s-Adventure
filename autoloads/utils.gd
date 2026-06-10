extends Node

# async function, creates a new timer, waits for time_interval seconds
func wait(time_interval: float) -> void:
	await get_tree().create_timer(time_interval).timeout
