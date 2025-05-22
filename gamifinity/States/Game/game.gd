extends Node2D

@onready var enemy_spawn = $EnemySpawn
@onready var enemy_spawn_2 = $EnemySpawn2
@onready var enemy_spawn_3 = $EnemySpawn3
@onready var timer = $Timer
@onready var ui = $UI

@export var enemy : PackedScene

var spawned_enemies : int = 0
var enemies = []

func _ready():
	ui.connect("damage", _task_finished)
	timer.start()

func _task_finished():
	if !enemies.is_empty():
		
		var top = enemies.pop_back()
		
		if top and is_instance_valid(top):
			top.queue_free()
			
			GameManager.player_exp += 10 * GameManager.player_lvl
			
			if spawned_enemies >= 2:
				spawned_enemies -= 2
			else:
				spawned_enemies -= 1
			if spawned_enemies <= 0:
				spawned_enemies = 0

func spawn_enemy():
	var e = enemy.instantiate()
	
	match spawned_enemies:
		0:
			enemy_spawn.add_child(e)
			enemies.append(e)
			spawned_enemies += 1
		1:
			enemy_spawn_2.add_child(e)
			enemies.append(e)
			spawned_enemies += 1
		2: 
			enemy_spawn_3.add_child(e)
			enemies.append(e)
			spawned_enemies += 1
		_:
			pass

func _on_timer_timeout():
	spawn_enemy()
