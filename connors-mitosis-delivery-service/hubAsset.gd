extends Area3D

var hub_id: int 
var data: HubData

func _ready():
	print("Hub %d is ready" % hub_id)



signal object_exited(object)

func _ready1():
	body_exited.connect(_on_body_exited)

func _on_body_exited(body):
	if body.name == "Bouncer":
		emit_signal("object_exited", body)
