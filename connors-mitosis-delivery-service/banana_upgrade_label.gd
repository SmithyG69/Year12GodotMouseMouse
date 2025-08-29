extends MeshInstance3D

func _process(delta: float) -> void:
	var text_mesh2 = $".".mesh
	if text_mesh2 is TextMesh:
		text_mesh2.text = "Banana Upgrade: %d" % Global.banana_upgrade_cost
