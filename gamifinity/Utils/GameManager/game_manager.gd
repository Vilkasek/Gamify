extends Node

var player_exp : int = 0
var player_lvl : int = 1
var next_lvl : int = 100 * player_lvl

func handle_leveling():
	if player_exp >= next_lvl:
		player_lvl += 1
		player_exp -= next_lvl
		next_lvl = 100 * player_lvl
		print(player_lvl)

func _process(delta):
	handle_leveling()
