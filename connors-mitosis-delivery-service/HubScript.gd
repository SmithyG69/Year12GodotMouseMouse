extends Node3D

var hub_id: int
var data: Dictionary = {}

func _ready():
	if data:
		print("Loaded Hub ID:", data.hub_id)

func _process(delta):
	if data:
		data.process_clone(delta)
