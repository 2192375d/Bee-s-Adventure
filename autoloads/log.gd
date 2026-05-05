extends Node

var file: FileAccess

func _ready() -> void:
	file = FileAccess.open("user://log.txt", FileAccess.WRITE)
	file.store_line("_______new run_______")

func add_message(message: String) -> void:
	file.store_line(message)
