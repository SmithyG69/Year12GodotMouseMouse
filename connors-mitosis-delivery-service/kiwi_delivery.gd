extends Area3D

var reward_giblits = 8

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var current_watermelon = get_tree().get_nodes_in_group("kiwi").size()
		var required_amount = Global.max_kiwi - 1
		if current_watermelon >= required_amount:
			Global.giblits += reward_giblits * Global.max_kiwi
			var melons = get_tree().get_nodes_in_group("kiwi")
			var to_remove = min(required_amount, melons.size())
			for i in range(to_remove):
				melons[i].queue_free()
