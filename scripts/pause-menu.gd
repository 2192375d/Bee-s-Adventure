extends Panel

@export var game: Game
@export var resume_button: Button

func _ready() -> void:
	hide()
	process_mode = Node.PROCESS_MODE_ALWAYS

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_escape"):
		if !visible:
			pause()
		else:
			resume()
		get_viewport().set_input_as_handled()
	
	if !visible:
		return
	
	if event.is_action_pressed("ui_shoot") || event.is_action_pressed("ui_enter"):
		get_viewport().set_input_as_handled()
		var focus_button: Button = get_viewport().gui_get_focus_owner()
		focus_button.pressed.emit()

func pause() -> void:
	
	game.get_tree().paused = true
	await get_tree().process_frame
	resume_button.grab_focus()
	show()

func resume() -> void:
	game.get_tree().paused = false
	hide()

func _on_resume_pressed() -> void:
	resume()

func _on_restart_pressed() -> void:
	game.get_tree().paused = false
	hide()
	get_tree().reload_current_scene()

func _on_exit_pressed() -> void:
	pass
