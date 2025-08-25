extends Area3D

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if Global.banana_upgrade_cost <= Global.giblits:
			Global.giblits =- Global.banana_upgrade_cost
			Global.max_banana = Global.max_banana * 2
			Global.banana_upgrade_cost = Global.banana_upgrade_cost * 22
