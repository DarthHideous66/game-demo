extends Node2D

@onready var enemy = get_node("enemy")

func _ready():
	pass
	


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()
	
	if get_tree().get_nodes_in_group("dirt").is_empty():
		get_tree().change_scene_to_file("res://game_over_2.tscn")


func _on_inventory_gui_closed():
	get_tree().paused = false


func _on_inventory_gui_opened():
	get_tree().paused = true
