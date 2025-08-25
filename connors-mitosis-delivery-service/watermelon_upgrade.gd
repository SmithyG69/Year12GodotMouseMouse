extends Area3D

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if Global.watermelon_upgrade_cost <= Global.giblits:
			Global.giblits =- Global.watermelon_upgrade_cost
			Global.max_watermelon = Global.max_watermelon * 2
			Global.watermelon_upgrade_cost = Global.watermelon_upgrade_cost * 22
