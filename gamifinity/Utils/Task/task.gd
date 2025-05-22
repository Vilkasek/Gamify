extends Label

@onready var task = $"."

signal finished_task

func _on_button_pressed():
	GameManager.player_exp += 10 * GameManager.player_lvl
	emit_signal("finished_task")
	queue_free()
