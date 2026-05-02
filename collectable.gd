extends Area2D

var slots = [$CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot, $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot2,
	 $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot3, $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot4,
	 $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot5, $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot6,
	 $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot7, $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot8,
	 $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot9, $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot10,
	 $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot11, $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot12,
	 $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot13, $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot14,
	 $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot15, $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot16,
	 $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot17, $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot18,
	 $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot19, $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot20,
	 $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot21, $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot22,
	 $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot23, $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot24,
	 $CanvasLayer/InventoryGui/NinePatchRect/GridContainer/Slot25]
var in_hand: bool = false

func _on_body_entered(body):
	if body.name == "Player":
		
		#in_hand = true
		#for i in slots:
			#if i.state == false:
				#i.fill()
		queue_free()
		
