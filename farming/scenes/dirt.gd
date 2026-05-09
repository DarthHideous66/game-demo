extends Area2D

@onready var anim = $AnimatedSprite2D
var health = 0

func _ready() -> void:
	health = 3
	anim.play("default")


func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	if body.has_method("player_identifier"):
		pass
