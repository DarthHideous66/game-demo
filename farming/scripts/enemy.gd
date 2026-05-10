extends CharacterBody2D

@onready var target_player = get_node("/root/World/Player/")
var speed = 100
var follow: bool = false
var dirts = []
const CARROT = preload("res://scenes/carrot.tscn")
const ENEMY = preload("res://scenes/enemy.tscn")

func _process(delta: float) -> void:
	pass



func _physics_process(delta: float) -> void:
	if follow:
		var direction = (target_player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()

func find_target():
	var closest = null
	var closest_distance = INF
	
	for dirt in get_tree().get_nodes_in_group("dirt"):
		if dirt.dug:
			var distance = global_position.distance_to(dirt.global_position)
			
			if distance < closest_distance:
				closest_distance = distance
				closest = dirt

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == target_player:
		follow = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == target_player:
		follow = false

func spawn(x, y):
	var enemy = ENEMY.instantiate()
	enemy.global_position = Vector2(x, y)
	get_tree().current_scene.add_child(enemy)
	

func die():
	var carrot = CARROT.instantiate()
	carrot.global_position = global_position
	get_tree().current_scene.add_child(carrot)
	queue_free()
