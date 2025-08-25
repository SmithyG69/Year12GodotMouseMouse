extends RigidBody3D

var banana = load("res://fruit/banana.tscn")
func random_vector(range = 1):
	var rng = RandomNumberGenerator.new()  
	rng.randomize()

	var random_vec = Vector3(
		rng.randf_range(-range, range),
	   	rng.randf_range(-range, range),
		rng.randf_range(-range, range),
	)
	return random_vec.normalized()


func _ready() -> void:
	add_to_group("bouncer")
	add_to_group("banana")
	$"spawn timer banana".timeout.connect(_on_spawn_timer_timeout)
	#direction = random_vector(2)
	linear_velocity = random_vector() * 2
	#apply_central_impulse(random_vector()*2)

func _physics_process(delta):
	#direction = direction.normalized()
	#velocity = direction * speed
	#move_and_slide()
	rotate_x(1.2 * delta)
	rotate_y(1.2 * delta)
	if linear_velocity.length() < 4:
		apply_impulse(linear_velocity)
	linear_velocity.clamp(Vector3(3,3,3), Vector3(-3,-3,-3))

#func bounce(axis: String) -> void:
	#match axis:
		#"x": direction.x *= -1
		#"z": direction.z *= -1
		#"y": direction.y *= -1

func _on_spawn_timer_timeout():
	var current_banana = get_tree().get_nodes_in_group("banana").size()
	
	if current_banana < Global.max_banana:
		var new_banana = banana.instantiate()
		get_tree().current_scene.add_child(new_banana)
		new_banana.global_position = global_position
		#new_kiwi.velocity = velocity * -1 
