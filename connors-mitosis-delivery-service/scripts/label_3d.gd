extends MeshInstance3D

func _process(delta: float) -> void:
	var text_mesh = $".".mesh
	if text_mesh is TextMesh:
		text_mesh.text = "Giblits: %d" % Global.giblits
