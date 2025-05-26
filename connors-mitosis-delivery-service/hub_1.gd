extends Node2D

@export var quota_required := 10
var current_count := 0

func _ready():
	if has_node("Timer"):
		$Timer.start()
	else:
		print("Timer node not found, troubleshoot")

func _on_Timer_timeout():
	if current_count < quota_required:
		current_count += 1
		print("Cloned something! Total:", current_count)
	else:
		print("Quota reached! Ready for delivery.")


func _on_timer_timeout() -> void:
	pass # Replace with function body.
