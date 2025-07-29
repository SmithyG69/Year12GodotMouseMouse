extends Area3D

@export var fruit_name: String = "watermelon"
@export var floating_text_scene: PackedScene
@export var required_amount = 7
@export var reward_giblits = 120
@onready var request_label: Label = $"../requestlabel"
@onready var reward_label: Label = $"../rewardlabel"

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
		attempt_fulfill_watermelon_request()


func attempt_fulfill_watermelon_request():
	var current_watermelon = get_tree().get_nodes_in_group("melon").size()
	
	if current_watermelon >= required_amount:
		Global.giblits += reward_giblits
		var melons = get_tree().get_nodes_in_group("melon")
		var to_remove = min(7, melons.size())
		for i in range(to_remove):
			melons[i].queue_free()
		
	else:
		return
