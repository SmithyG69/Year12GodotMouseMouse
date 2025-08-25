extends Area3D

var reward_giblits = 15

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	var current_watermelon = get_tree().get_nodes_in_group("melon").size()
	var required_amount = Global.max_watermelon - 1
	if current_watermelon >= required_amount:
		Global.giblits += reward_giblits * Global.max_watermelon
		Global.request = Global.get_random_unlocked()
		var melons = get_tree().get_nodes_in_group("melon")
		var to_remove = min(required_amount, melons.size())
		for i in range(to_remove):
			melons[i].queue_free()
