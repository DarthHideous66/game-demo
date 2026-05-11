extends Panel

@onready var anim = $Sprite2D
var alive: bool = true

func _ready() -> void:
	anim.play("full")
	alive = true

func state():
	return alive

func die():
	alive = false

func heal():
	alive = true


func _process(delta: float) -> void:
	if alive == false:
		anim.play("lost")
	else:
		anim.play("full")
