extends Area3D

@export var hub_scene: PackedScene
@export var hub_id: int

func _ready():
	connect("input_event", Callable(self, "_on_input_event"))

func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Clicked on hub ID:", hub_id)
		if hub_scene:
			get_tree().change_scene_to_packed(hub_scene)
