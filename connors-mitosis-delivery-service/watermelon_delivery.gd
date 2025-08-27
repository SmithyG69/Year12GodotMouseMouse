extends Area3D

@export var reward_giblits = 2


func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	var new_watermelon = load("res://fruit/watermelon.tscn")
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var current_watermelon = get_tree().get_nodes_in_group("melon").size()
		if current_watermelon >= 2:
			Global.giblits += reward_giblits * current_watermelon
			#Global.request = Global.get_random_unlocked()
			var melons = get_tree().get_nodes_in_group("melon")
			var to_remove = min(current_watermelon, melons.size())
			for i in range(to_remove-1):
				melons[i].queue_free()
