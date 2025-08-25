extends MeshInstance3D

func _process(delta: float) -> void:
	var timer = Timer.new()
	timer.wait_time = 1.0
	var text_mesh = $".".mesh
	if text_mesh is TextMesh:
		if Global.request == null:
			Global.request = Global.get_random_unlocked()
		text_mesh.text = "Request: Deliver " + str(Global.request)
