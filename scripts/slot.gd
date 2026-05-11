extends Panel
@onready var anim = $AnimatedSprite2D
@onready var player = get_node("/root/World/Player")
var filled = [false, "None"]
var equipped: bool = false
var used: bool = false

func _process(delta: float) -> void:
	if used:
		filled = [false, "None"]
		used = false
	if filled[0] == false:
		anim.play("base")
	if player.equipped() != null:
		if player.equipped() != filled[1]:
			equipped = false

func _ready() -> void:
	pass

func use():
	used = true
	equipped = false

func state():
	return filled


func equip():
	equipped = true


func return_equipped():
	return equipped
	

func fill(type):
	filled = [true, type]
	if type == "carrot":
		anim.play("carrot")
	elif type == "shovel":
		anim.play("shovel")
	


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if equipped:
			equipped = false
		else:
			equip()
			if player.equipped() != filled[1]:
				player.change_equipped(filled[1])
