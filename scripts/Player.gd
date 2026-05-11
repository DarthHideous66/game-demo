extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var right_anim = $attack_right_sprite
@onready var left_anim = $attack_left_sprite
@onready var equipped_anim = $equipped
@onready var hearts = [$heart, $heart2, $heart3]


const SPEED = 300.0
var current_animation = ""
var slots = []
var inside_right: bool = false
var inside_left: bool = false
var thing = ""
var direction = ""
var play_right_attack: bool = false
var play_left_attack: bool = false
var equipped_item = "default"

func _ready():
	current_animation = "idle"
	slots = [get_node("/root/World/CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot"), get_node("/root/World/CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot2"),
 get_node("/root/World/CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot3"), get_node("/root/World/CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot4"),
 get_node("/root/World/CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot5"), get_node("/root/World/CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot6"), get_node("/root/World/CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot8"),
 get_node("/root/World/CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot9")]
	equipped_anim.play("default")

func player_identifier():
	pass



func _process(delta: float) -> void:


	equipped_item = "default"
	if velocity.x == 0 and velocity.y == 0:
		current_animation = "idle"
	anim.play(current_animation)
	for i in hearts:
		if i.state() == false and i.name == "heart3":
			death()
	if play_right_attack:
		if direction == "right":
			right_anim.play("attack")
	elif play_right_attack == false:
		right_anim.pause()
			
	if play_left_attack:
		if direction == "left":
			left_anim.play("attack")
	elif play_left_attack == false:
		left_anim.pause()
		
	for i in slots:
		if i.return_equipped() and i.state()[1] == "carrot":
			equipped_item = "carrot"
			if Input.is_action_just_pressed("use"):
					for x in hearts:
						if x.state() == false:
							x.heal()
							i.use()
							break
	for i in slots:
		if i.return_equipped() and i.state()[1] == "shovel":
			equipped_item = "shovel"
			
	if inside_right:
		if Input.is_action_just_pressed("attack"):
			if direction == "right":
				thing.die()
				
	elif inside_left:
		if Input.is_action_just_pressed("attack"):
			if direction == "left":
				thing.die()
				

	equipped_anim.play(equipped_item)
	
	for i in slots:
		if i.return_equipped():
			if Input.is_action_just_pressed("delete"):
				i.use()
	
func death():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func _physics_process(delta: float) -> void:

	var directionx := Input.get_axis("Left", "Right")
	if directionx == 1:
		direction = "right"
	elif directionx == -1:
		direction = "left"
	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var directiony := Input.get_axis("Up", "Down")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	if directionx == 1:
		current_animation = "run_right"
	elif directionx == -1:
		current_animation = "run_left"
	
	if directiony == 1:
		current_animation = "run_downward"
	elif directiony == -1:
		current_animation = "run_upward"
		
	if Input.is_action_just_pressed("attack"):
		if direction == "right":
			play_right_attack = true
		if direction == "left":
			play_left_attack = true
	move_and_slide()
	
func equipped():
	return equipped_item

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("die"):
		
			for x in hearts:
				if x.state():
					x.die()
					break


func _on_right_attack_body_entered(body: Node2D) -> void:
	if body.has_method("die"):
		inside_right = true
		thing = body


func _on_right_attack_body_exited(body: Node2D) -> void:
	if body.has_method("die"):
		inside_right = false
		thing = ""


func _on_left_attack_body_entered(body: Node2D) -> void:
	if body.has_method("die"):
		inside_left = true
		thing = body


func _on_left_attack_body_exited(body: Node2D) -> void:
	if body.has_method("die"):
		inside_left = false
		thing = ""


func _on_attack_right_sprite_animation_looped() -> void:
	play_right_attack = false


func _on_attack_left_sprite_animation_looped() -> void:
	play_left_attack = false
