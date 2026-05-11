extends Node2D

const ENEMY = preload("res://scenes/enemy.tscn")
@onready var label = get_node("/root/World/Player/Label")
@onready var enemy_label = get_node("/root/World/Player/enemy_label")
@onready var survived_label = get_node("/root/World/Player/survived")
@onready var dirts = get_node("/root/World/Player/dirts")
var wave = 1
var enemies_to_spawn = 5
var enemies_spawned = 0
var enemies_alive = 0

func _ready() -> void:
	start_wave()
	update_ui()
		

func _process(delta: float) -> void:
	update_ui()

func start_wave():
	enemies_spawned = 0
	enemies_alive = enemies_to_spawn
	$SpawnTimer.start(1)
	survived_label.text = ""

func update_ui():
	label.text = "Wave: " + str(wave)
	enemy_label.text = "Enemies left: " + str(enemies_alive)
	dirts.text = "Dirt tiles left: " + str(get_tree().get_nodes_in_group("dirt").size())

func enemy_died():
	enemies_alive -= 1
	if enemies_alive <= 0:
		$WaveTimer.start(10)
		survived_label.text = "You survived wave" + str(wave)

func _on_spawn_timer_timeout() -> void:
	var positions = [
		Vector2(100, 100),
		Vector2(500, 500),
		Vector2(100, 500)
	]
	var pos = positions.pick_random()
	var enemy = ENEMY.instantiate()
	enemy.global_position = pos
	get_tree().current_scene.add_child(enemy)
	enemies_spawned += 1
	if enemies_spawned >= enemies_to_spawn:
		$SpawnTimer.stop()


func _on_wave_timer_timeout() -> void:
	wave += 1
	enemies_to_spawn += 3
	start_wave()
