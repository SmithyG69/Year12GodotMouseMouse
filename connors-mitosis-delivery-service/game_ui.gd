extends Control  # Or whatever your root node type is

@onready var hubs_container = $RightPanel/ScrollContainer/GridContainer
@export var hub_scene: PackedScene # Drag your Hub.tscn here in the Inspector

func _ready():
	for i in range(6):  # Add 6 hubs on load
		var hub = hub_scene.instantiate()
		hub.hub_id = i
		hubs_container.add_child(hub)
