extends Area3D

@export var fruit_name: String = "watermelon"
@export var floating_text_scene: PackedScene
@export var required_amount = 7
@export var reward_giblits = 120

func _input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		attempt_fulfill_watermelon_request()

func attempt_fulfill_watermelon_request():
	# Find all watermelons in the scene
	var melons = []
	for node in get_tree().get_nodes_in_group("melon"):
		if node.name.to_lower().contains(fruit_name):  # or check node.fruit_type
			melons.append(node)

	if melons.size() >= required_amount:
		# Remove 7 melons
		for i in required_amount:
			if melons[i]:
				melons[i].queue_free()
		# Add giblits
		Global.giblits += reward_giblits
		show_floating_text("+%d Giblits!" % reward_giblits, Color.GREEN)
	else:
		show_floating_text("Need %d Watermelons!" % required_amount, Color.RED)

func show_floating_text(message: String, color: Color = Color.WHITE):
	var text_node = floating_text_scene.instantiate()
	var label = text_node.get_node("Label3D")  # change path if needed
	label.text = message
	label.modulate = color
	text_node.global_transform.origin = global_transform.origin + Vector3(0, 2, 0)
	get_tree().current_scene.add_child(text_node)

	var tween = text_node.create_tween()
	tween.tween_property(text_node, "position", text_node.position + Vector3(0, 1.5, 0), 1.5)\
	.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_callback(Callable(text_node, "queue_free"))
