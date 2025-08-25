extends Area3D

var reward_giblits = 50

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var current_banana = get_tree().get_nodes_in_group("banana").size()
		var required_amount = Global.max_banana - 1
		if current_banana >= required_amount:
			Global.giblits += reward_giblits * Global.max_banana
			Global.request = Global.get_random_unlocked()
			var melons = get_tree().get_nodes_in_group("banana")
			var to_remove = min(required_amount, melons.size())
			for i in range(to_remove):
				melons[i].queue_free()
