extends Area2D

@onready var anim = $AnimatedSprite2D
@onready var timer =$Timer
@onready var plant_anim = $plants
var health = 0
var dug = false
var bodyy = null
var is_inside = false
var take_damage: bool = false

func _ready() -> void:
	health = 3
	is_inside = false
	anim.play("default")
	dug = false
	add_to_group("dirt")
	take_damage = false


func _process(delta: float) -> void:
	if dug == true:
		anim.play("plantable")
	else:
		anim.play("default")
		
	if is_inside:
		if bodyy.equipped() == "shovel":
			if Input.is_action_just_pressed("use"):
				dig()
				
		elif bodyy.equipped() == "carrot":
			if Input.is_action_just_pressed("plant"):
				plant_anim.play("has_plant")
				
	if health == 0:
		queue_free()

func dig():
	dug = true

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("player_identifier"):
		is_inside = true
		bodyy = body
	elif body.has_method("enemy_identifier"):
		timer.start(5)
		take_damage = true



func _on_body_exited(body: Node2D) -> void:
	is_inside = false
	if body.has_method("enemy_identifier"):
		take_damage = false


func _on_timer_timeout() -> void:
	if take_damage:
		health -= 1
		if health > 0:
			timer.start(5)
