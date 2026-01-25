extends Label

@onready var timer: Timer = Timer.new()
@onready var count: int = 0

func _ready() -> void:
	timer.one_shot = false
	timer.autostart = true
	timer.wait_time = 1
	timer.timeout.connect(_on_timer_timeout)
	get_parent().add_child.call_deferred(timer)

func _on_timer_timeout() -> void:
	count += 1
	text = "%d" % count
