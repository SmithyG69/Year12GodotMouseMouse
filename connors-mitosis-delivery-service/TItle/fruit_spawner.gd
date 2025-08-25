extends Node3D

@export var fruit_scene: PackedScene
@export var count: int = 16
@export var spawn_radius: float = 6.0   # must be < bounds_half_extent
@export var y_center: float = 0.0
@export var random_y_range: float = 4.0 # spawn between y_center±this

func _ready():
	assert(fruit_scene, "Assign Fruit.tscn to fruit_scene in the Inspector.")
	randomize()
	for i in range(count):
		_spawn_one()

func _spawn_one():
	var f: RigidBody3D = fruit_scene.instantiate()
	var pos = Vector3(
		randf_range(-spawn_radius, spawn_radius),
		y_center + randf_range(-random_y_range, random_y_range),
		randf_range(-spawn_radius, spawn_radius)
	)
	f.global_transform.origin = pos
	add_child(f)
