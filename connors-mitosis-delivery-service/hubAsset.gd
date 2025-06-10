extends Node3D

var hub_id: int = 0
var data: HubData

func _ready():
	print("Hub %d is ready" % hub_id)
