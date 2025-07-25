extends Area3D

@export var bounce_axis: String = "y"


func _on_body_entered(body: Node3D) -> void:
	
	if body.is_in_group("bouncer") and body.has_method("bounce"):
		body.bounce(bounce_axis)
