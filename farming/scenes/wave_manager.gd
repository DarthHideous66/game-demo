extends Node2D

const ENEMY = preload("res://scenes/enemy.tscn")
var wave = 1
var enemies_to_spawn = 5
var enemies_spawned = 0
var enemies_alive = 0

func _ready() -> void:
	start_wave()
		

func _process(delta: float) -> void:
	pass

func start_wave():
	enemies_spawned = 0
	enemies_alive = enemies_to_spawn
	$SpawnTimer.start(1)
	
func enemy_died():
	enemies_alive -= 1
	if enemies_alive <= 0:
		$WaveTimer.start(10)

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
