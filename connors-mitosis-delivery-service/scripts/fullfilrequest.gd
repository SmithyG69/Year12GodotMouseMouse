extends Area3D



@export var fruit_name: String = "watermelon"
@export var floating_text_scene: PackedScene
@export var required_amount = 7
@export var reward_giblits = 120
#@onready var request_label: Label = $"../requestlabel"
#@onready var reward_label: Label = $"../rewardlabel"






func attempt_fulfill_watermelon_request():
	var current_watermelon = get_tree().get_nodes_in_group("melon").size()
	
	if current_watermelon >= required_amount:
		Global.giblits += reward_giblits
		var melons = get_tree().get_nodes_in_group("melon")
		var to_remove = min(required_amount, melons.size())
		for i in range(to_remove):
			melons[i].queue_free()
		
	else:
		return

func attempt_fulfill_Kiwi_request():
	var current_kiwi = get_tree().get_nodes_in_group("melon").size()
	
	if current_kiwi >= required_amount:
		Global.giblits += reward_giblits
		var kiwi = get_tree().get_nodes_in_group("melon")
		var to_remove = min(required_amount, kiwi.size())
		for i in range(to_remove):
			kiwi[i].queue_free()
		
	else:
		return

func attempt_fulfill_banana_request():
	var current_banana = get_tree().get_nodes_in_group("banana").size()
	
	if current_banana >= required_amount:
		Global.giblits += reward_giblits
		var banana = get_tree().get_nodes_in_group("banana")
		var to_remove = min(required_amount, banana.size())
		for i in range(to_remove):
			banana[i].queue_free()
		
	else:
		return
