extends Button

@export var fruit_name: String = "watermelon"
@export var floating_text_scene: PackedScene
@export var required_amount = 7
@export var reward_giblits = 120
@onready var request_label: Label = $"../requestlabel"
@onready var reward_label: Label = $"../rewardlabel"

func _on_pressed() -> void:
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

func _ready():
	request_label.text = "Need " + str(required_amount) + " Melons"
	reward_label.text  = "+ " + str(reward_giblits) + " Giblits"
