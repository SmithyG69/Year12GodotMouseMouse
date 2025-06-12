extends Node3D

@export var hub_asset: PackedScene  # Drag your hub 3D model scene here
@export var click_zone_scene: PackedScene  # Drag ClickZone.tscn here

func _ready():
	var columns = 3
	var rows = 3
	var spacing = 6.0

	var grid_width = (columns - 1) * spacing
	var grid_height = (rows - 1) * spacing

	for i in range(columns * rows):
		var hub = hub_asset.instantiate()
		hub.data = GameManager.get_hub_data(i)
		
		var col = i % columns
		var row = i / columns
		row = int(row)
		var x = col * spacing - grid_width / 2
		var z = row * spacing - grid_height / 2
		var position = Vector3(x + 4, -40, z)

		hub.position = position
		$WorldRoot.add_child(hub)

		# Instantiate ClickZone and configure it
		var click_zone = click_zone_scene.instantiate()
		click_zone.position = position + Vector3(0, 2, 0)  # slightly above hub
		click_zone.hub_id = i

		# Safely load and assign the correct HubScene
		var scene_path = "res://HubScenes/HubScene_%d.tscn" % i
		if ResourceLoader.exists(scene_path):
			click_zone.hub_scene = load(scene_path)
		else:
			print("Hub scene not found:", scene_path)

		$WorldRoot.add_child(click_zone)

		print("Hub", i, "position:", position)
