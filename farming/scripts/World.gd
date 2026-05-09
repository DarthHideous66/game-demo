extends Node2D

@onready var enemy = get_node("enemy")

func _ready():
	enemy.spawn(100, 100)
	


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()


func _on_inventory_gui_closed():
	get_tree().paused = false


func _on_inventory_gui_opened():
	get_tree().paused = true
