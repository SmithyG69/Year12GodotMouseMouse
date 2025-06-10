extends Node3D

@export var hub_asset: PackedScene  # Drag your Hub.tscn here







func _ready():
	var columns = 3
	var rows = 3
	var spacing = 6.0

	var grid_width = (columns - 1) * spacing
	var grid_height = (rows - 1) * spacing

	for i in range(columns * rows):
		var hub = hub_asset.instantiate() #Gives the hubinstaced a varaible 
		hub.data = GameManager.get_hub_data(i)  # This gives each hub its own data by ID
		add_child(hub)
		var col = i % columns
		var row = i / columns
		row = int(row)

		var x = col * spacing - grid_width / 2
		var z = row * spacing - grid_height / 2

		hub.position = Vector3(x + 4, -40, z)
		$WorldRoot.add_child(hub)
		print("Hub", i, "position:", hub.position)
		
		
