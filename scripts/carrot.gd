extends Area2D
var slots = []


func _ready():
	slots = [get_node("/root/World/CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot"), get_node("/root/World/CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot2"),
 get_node("/root/World/CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot3"), get_node("/root/World/CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot4"),
 get_node("/root/World/CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot5"), get_node("/root/World/CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot6"), get_node("/root/World/CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot8"),
 get_node("/root/World/CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot9")]



func _on_body_entered(body):
	if body.name == "Player":
		for i in slots:
			if not i.state()[0]:
				i.fill("carrot")
				queue_free()
				break
		
