extends Panel
@onready var anim = $AnimatedSprite2D
var filled = [false, "None"]
var equipped: bool = false
var used: bool = false

func _process(delta: float) -> void:
	if used:
		filled = [false, "None"]
		used = false
	if filled[0] == false:
		anim.play("base")

func _ready() -> void:
	pass

func use():
	used = true

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
	


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if equipped:
			equipped = false
		else:
			equip()
