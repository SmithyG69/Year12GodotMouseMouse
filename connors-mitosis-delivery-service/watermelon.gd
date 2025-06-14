extends CharacterBody3D

var direction = Vector3(1, 0, 0.9).normalized()
var speed = 2.0
@export var max_watermelons = 8
var watermelon = preload("res://watermelon.tscn")

func _ready() -> void:
	add_to_group("bouncer")
	add_to_group("melon")
	$"spawn timer".timeout.connect(_on_spawn_timer_timeout)


func _physics_process(delta):
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
	rotate_x(1.2 * delta)
	rotate_y(1.2 * delta)
	direction.y = 0

func bounce(axis: String) -> void:
	match axis:
		"x": direction.x *= -1
		"z": direction.z *= -1
		"y": direction.y *= -1

func _on_spawn_timer_timeout():
	var current_watermelon = get_tree().get_nodes_in_group("melon").size()
	
	if current_watermelon < max_watermelons:
		var new_watermelon = watermelon.instantiate()
		get_tree().current_scene.add_child(new_watermelon)
		new_watermelon.global_position = global_position
		new_watermelon.velocity = velocity * -1 
