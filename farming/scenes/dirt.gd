extends Area2D

@onready var anim = $AnimatedSprite2D
var health = 0
var dug = false
var bodyy = null
var is_inside = false

func _ready() -> void:
	health = 3
	is_inside = false
	anim.play("default")
	dug = false
	add_to_group("dirt")


func _process(delta: float) -> void:
	if dug == true:
		anim.play("plantable")
	else:
		anim.play("default")
		
	if is_inside:
		if bodyy.equipped() == "shovel":
				if Input.is_action_just_pressed("use"):
					dig()

func dig():
	dug = true

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("player_identifier"):
		is_inside = true
		bodyy = body



func _on_body_exited(body: Node2D) -> void:
	is_inside = false
