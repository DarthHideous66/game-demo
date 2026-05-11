extends CanvasLayer


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Reset"):
		get_tree().change_scene_to_file("res://scenes/World.tscn")
