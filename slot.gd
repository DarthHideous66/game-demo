extends Panel

var filled: bool = false
func _ready() -> void:
	pass

func state():
	return filled

func fill():
	filled = true

func _process(delta: float) -> void:
	pass
