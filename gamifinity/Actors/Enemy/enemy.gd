extends Area2D

var life : int = 20
var max_life : int = 20 * GameManager.player_lvl

@onready var health_bar = $HealthBar

func _process(delta):
	health_bar.max_value = max_life
	health_bar.value = life
