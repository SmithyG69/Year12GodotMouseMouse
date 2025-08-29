extends MeshInstance3D

func _process(delta: float) -> void:
	var text_mesh = $".".mesh
	if text_mesh is TextMesh:
		text_mesh.text = "Watermelon Upgrade: %d" % Global.watermelon_upgrade_cost
