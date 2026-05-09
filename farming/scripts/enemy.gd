extends CharacterBody2D

@onready var target = get_node("/root/World/Player/")
var speed = 100
var follow: bool = false
const CARROT = preload("res://scenes/carrot.tscn")
const ENEMY = preload("res://scenes/enemy.tscn")

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if follow:
		var direction = (target.position - position).normalized()
		velocity = direction * speed
		move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == target:
		follow = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == target:
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
