extends MeshInstance3D

func _process(delta: float) -> void:
	var text_mesh1 = $".".mesh
	if text_mesh1 is TextMesh:
		text_mesh1.text = " Kiwi Upgrade: %d" % Global.kiwi_upgrade_cost
