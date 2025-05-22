extends CanvasLayer

@onready var input_field = $Panel/TextField
@onready var add_button = $Panel/Button
@onready var tile_container = $Panel/Container
@onready var exp = $Exp

@export var task : PackedScene

signal damage

func _ready():
	input_field.connect("text_submitted", _on_text_entered)
	add_button.connect("pressed", _on_add_button_pressed)

func _process(delta):
	exp.max_value = GameManager.next_lvl
	exp.value = GameManager.player_exp

func _on_finished_task():
	emit_signal("damage")

func _on_text_entered(text):
	_try_add_tile(text)

func _on_add_button_pressed():
	_try_add_tile(input_field.text)

func _try_add_tile(text):
	if text.strip_edges() != "":
		_add_tile(text)
		input_field.clear()

func _add_tile(text):
	var tile = task.instantiate()
	tile.set_text(text)
	tile.connect("finished_task", _on_finished_task)
	tile_container.add_child(tile)
