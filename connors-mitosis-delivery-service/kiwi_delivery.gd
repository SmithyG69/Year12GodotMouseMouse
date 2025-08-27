extends Area3D

var reward_giblits = 8

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var current_kiwi = get_tree().get_nodes_in_group("kiwi").size()
		if current_kiwi >= 2:
			Global.giblits += reward_giblits * current_kiwi
			var kiwi = get_tree().get_nodes_in_group("kiwi")
			var to_remove = min(current_kiwi, kiwi.size())
			for i in range(to_remove):
				kiwi[i].queue_free()
