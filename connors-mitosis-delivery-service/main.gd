extends Node3D

@export var hub_scene: PackedScene  # Drag your Hub.tscn here

func _ready():
	var columns = 3
	var rows = 3
	var spacing = 6.0

	var grid_width = (columns - 1) * spacing
	var grid_height = (rows - 1) * spacing

	for i in range(columns * rows):
		var hub = hub_scene.instantiate()
		var col = i % columns
		var row = i / columns
		row = int(row)

		var x = col * spacing - grid_width / 2
		var z = row * spacing - grid_height / 2

		hub.position = Vector3(x, -40, z)
		$WorldRoot.add_child(hub)
		print("Hub", i, "position:", hub.position)
