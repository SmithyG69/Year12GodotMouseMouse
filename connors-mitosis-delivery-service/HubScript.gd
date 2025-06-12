extends Node3D

var hub_id: int
var data: Dictionary = {}


func _ready():
	if data:
		print("Loaded Hub ID:", data.hub_id)
		


#func _process(delta):
#	if data:
		#data.process_clone(delta)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
