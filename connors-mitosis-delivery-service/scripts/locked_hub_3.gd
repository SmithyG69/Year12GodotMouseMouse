extends Node3D

@export var cost = 800
@export var banana_hub: PackedScene
@export var lockedhub2: PackedScene

func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if Global.giblits >= cost and banana_hub and lockedhub2:
			Global.giblits -= cost
			print("hi")

			# Spawn replacement in current position
			var new_obj2 = banana_hub.instantiate()
			new_obj2.global_transform = global_transform
			get_parent().add_child(new_obj2)

			# Spawn altered version slightly to the right
			var newlockedhub = lockedhub2.instantiate()
			var new_transform = global_transform
			new_transform.origin.x += -12.0  
			newlockedhub.global_transform = new_transform
			get_parent().add_child(newlockedhub)
			
			queue_free()
